# Maintainer: Dino Hensen <dino.hensen@gmail.com>
pkgname=whisper-dictate-git
pkgver=r16.1b49c08
pkgrel=1
pkgdesc='Toggle local speech-to-text dictation using whisper.cpp'
arch=('any')
url='https://github.com/dhensen/whisper-dictate'
license=('MIT')
depends=('whisper-cpp' 'ydotool' 'libnotify' 'pipewire-audio' 'curl' 'systemd')
optdepends=('python-gobject: recording indicator with live spectrum'
            'gtk4: recording indicator with live spectrum'
            'gtk4-layer-shell: recording indicator with live spectrum')
makedepends=('git')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')
provides=('whisper-dictate')
conflicts=('whisper-dictate')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -Dm755 "$srcdir/$pkgname/whisper-dictate-toggle" "$pkgdir/usr/bin/whisper-dictate-toggle"
    install -Dm755 "$srcdir/$pkgname/whisper-dictate-overlay" "$pkgdir/usr/bin/whisper-dictate-overlay"
    install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
