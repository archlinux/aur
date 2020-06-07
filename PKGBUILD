# Maintainer:  Wez Furlong <wez at wezfurlong dot org>

pkgname=wezterm-nightly-bin
pkgver=20200517.122836.92c201c6.105.g5d508350
pkgrel=1
pkgdesc='Bleeding edge builds of a GPU-accelerated cross-platform terminal emulator and multiplexer implemented in Rust'
arch=('i686' 'x86_64')
url='https://wezfurlong.org/wezterm'
license=('MIT')
provides=('wezterm')
# Don't strip: it will break the AppImage!
options=('!strip')
depends=('fuse' 'libx11')
conflicts=('wezterm-bin')
source=("wezterm::https://github.com/wez/wezterm/releases/download/nightly/WezTerm-nightly-Ubuntu16.04.AppImage"
        'LICENSE::https://github.com/wez/wezterm/raw/master/LICENSE.md')
sha256sums=('SKIP' 'SKIP')

prepare() {
  chmod +x ${srcdir}/wezterm
}

pkgver() {
  ${srcdir}/wezterm --version | cut -d' ' -f2 | tr - .
}

package() {
  install -Dm755 wezterm -t "${pkgdir}/usr/bin/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
