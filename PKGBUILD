
_pkgname=xkb-monitor
pkgname=$_pkgname-git
pkgver=42f2140
pkgrel=1
pkgdesc='A lightweight utility that monitors keyboard state on Wayland compositors'
arch=('x86_64')
url='https://github.com/drougas/xkb-monitor'
license=('MIT')
depends=('wayland' 'wayland-protocols' 'libxkbcommon')
makedepends=('git' 'make')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('git+https://github.com/drougas/xkb-monitor.git')

sha256sums=("SKIP")

pkgver() {
  cd $_pkgname
  git describe --always | sed "s/-/./g"
}

build() {
  cd xkb-monitor
  make release
}

package() {
  cd xkb-monitor
  install -Dm755 xkb-monitor "$pkgdir/usr/bin/xkb-monitor"
  mkdir -p "${pkgdir}/usr/share/doc/xkb-monitor/"
  install -m644 README.md "${pkgdir}/usr/share/doc/xkb-monitor/"
}
