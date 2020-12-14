# Maintainer: Daniel Maslowski <info@orangecms.org>

pkgname=upplay-git
pkgver=1.4.8.r1.gf256b6a
pkgrel=1
pkgdesc="A Qt-based UPnP audio Control point"
url="https://www.lesbonscomptes.com/upplay/"
arch=(x86_64)
license=(GPL2)
depends=(libupnpp qt5-webkit jsoncpp)
makedepends=(git qt5-script)
provides=(upplay)
conflicts=(upplay)
source=("git+https://framagit.org/medoc92/upplay.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^UPPLAY_//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"
  qmake -o Makefile upplay.pro PREFIX=/usr
}

package() {
  cd "${pkgname%-git}"
  make install INSTALL_ROOT="${pkgdir}"
}
