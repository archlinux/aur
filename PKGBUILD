# Maintainer: Daniel Maslowski <info@orangecms.org>
# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=upplay-git
pkgver=1.7.3.r0.g9d00c11
pkgrel=2
pkgdesc="A Qt-based UPnP audio Control point"
url="https://www.lesbonscomptes.com/upplay/"
arch=(x86_64)
license=(GPL2)
depends=(libupnpp qt6-base qt6-webchannel qt6-webengine jsoncpp glibc gcc-libs hicolor-icon-theme)
depends+=(libupnpp.so)
makedepends=(git qt6-tools)
provides=(upplay)
conflicts=(upplay)
source=("git+https://framagit.org/medoc92/upplay.git")
sha256sums=('SKIP')

pkgver() {
  cd upplay
  git describe --long --tags | sed 's/^UPPLAY_//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd upplay
  qmake6 -o Makefile upplay.pro PREFIX=/usr
}

package() {
  cd upplay
  make install INSTALL_ROOT="${pkgdir}"
}
