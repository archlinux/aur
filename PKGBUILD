# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Alfredo Ramos <alfredo dot ramos at yandex dot com>

pkgname=pythonqt-git
pkgver=3.5.6.r2.g39ef1f05
pkgrel=2
pkgdesc="A dynamic Python binding for Qt applications"
arch=(x86_64)
url="https://github.com/MeVisLab/pythonqt"
license=(LGPL-2.1-only)
depends=(glibc gcc-libs python qt5-base qt5-multimedia qt5-svg qt5-webkit   qt5-declarative qt5-xmlpatterns) #qt5-webengine qt5-webchannel
makedepends=(git qt5-tools)
provides=(pythonqt)
conflicts=(pythonqt)
source=("git+https://github.com/MeVisLab/pythonqt.git")
sha256sums=('SKIP')

pkgver() {
  cd "pythonqt"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "pythonqt"
  qmake-qt5 \
    PYTHON_VERSION=$(python -c 'import sys; print(".".join(sys.version.split(".")[:2]))') \
    QMAKE_CFLAGS="${CFLAGS}" \
    QMAKE_CXXFLAGS="${CXXFLAGS}" \
    CONFIG+=release
  make
}

package() {
  cd "pythonqt"
 make install INSTALL_ROOT="${pkgdir}/usr"
}
