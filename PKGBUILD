# Maintainer: Daniel Maslowski <info@orangecms.org>

pkgname=upplay-git
pkgver=1.7.2.r0.gd60f190
pkgrel=2
pkgdesc="A Qt-based UPnP audio Control point"
url="https://www.lesbonscomptes.com/upplay/"
arch=(x86_64)
license=(GPL2)
depends=(libupnpp qt5-base qt5-webkit qtmpris jsoncpp glibc gcc-libs hicolor-icon-theme)
makedepends=(git qt5-script)
provides=(upplay)
conflicts=(upplay)
source=("git+https://framagit.org/medoc92/upplay.git")
sha256sums=('SKIP')

pkgver() {
  cd "upplay"
  git describe --long --tags | sed 's/^UPPLAY_//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "upplay"
  qmake -o Makefile upplay.pro PREFIX=/usr
}

package() {
  depends+=(libupnpp.so)
  cd "upplay"
  make install INSTALL_ROOT="${pkgdir}"
}
