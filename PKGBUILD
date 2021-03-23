pkgname=pipewire-pulse-completion
pkgdesc="bash completion for various pulseaudio commands"
pkgver=14.2
pkgrel=2
arch=(x86_64)
url="https://www.freedesktop.org/wiki/Software/PulseAudio/"
license=(GPL)
makedepends=(git)
depends=(pipewire)
_commit=6a487c5244563f49a025088de3510c80824fc99e  # tags/v14.2^0
source=("git+https://gitlab.freedesktop.org/pulseaudio/pulseaudio.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd pulseaudio
  git describe --tags | sed 's/^v//;s/-/+/g'
}

package() {
  aliases=(
    'pacat'
    'pacmd'
    'pactl'
    'padsp'
    'paplay'
    'parec'
    'parecord'
    'pasuspender'
  )
  compdir="$pkgdir"/usr/share/bash-completion/completions
  install -Dm 644 "$srcdir"/pulseaudio/shell-completion/bash/pulseaudio "$compdir"/pulseaudio
  mkdir -p "$compdir"
  for a in "${aliases[@]}"; do
    ln -s pulseaudio "$compdir"/$a
  done
}
