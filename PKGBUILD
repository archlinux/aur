# Maintainer: mafuzyk <mafuzyk@gmail.com>

pkgname=koral-bin-nightly
_tag=2.0.0-alpha.1
pkgver=2.0.0alpha1
pkgrel=1
pkgdesc="A GPU-accelerated Rust terminal emulator (2.0 alpha / nightly pre-release)"
arch=('x86_64')
url="https://github.com/mafuzyk/koral"
license=('GPL-3.0-only')
depends=(
  'fontconfig'
  'gcc-libs'
  'glibc'
  'hicolor-icon-theme'
  'libglvnd'
  'libx11'
  'libxcursor'
  'libxi'
  'libxkbcommon'
  'libxrandr'
  'ncurses'
  'vulkan-icd-loader'
  'wayland'
)
optdepends=(
  'libnotify: desktop notifications from programs'
  'ttf-iosevkaterm-nerd: default font'
  'xdg-utils: open links'
)
provides=('koral')
conflicts=('koral' 'koral-bin')
options=('!debug')
source=("koral-${_tag}.tar.gz::${url}/releases/download/v${_tag}/koral-x86_64-linux.tar.gz")
sha256sums=('00db9fa3ad9a44439be9e44850963f2aadae9cc65d38123e48e6ba7b6b875259')

package() {
  install -Dm755 koral "$pkgdir/usr/bin/koral"
  install -Dm644 koral.desktop "$pkgdir/usr/share/applications/koral.desktop"
  install -Dm644 koral.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/koral.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  if [ -f xterm-koral.terminfo ]; then
    install -dm755 "$pkgdir/usr/share/terminfo"
    tic -x -o "$pkgdir/usr/share/terminfo" xterm-koral.terminfo
  fi
}
