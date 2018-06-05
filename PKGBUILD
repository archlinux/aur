# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_reponame=qtutilities
pkgname=qtutilities
pkgver=5.10.0
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc='Common Qt related C++ classes and routines used by my applications such as dialogs, widgets and models'
license=('GPL')
depends=('c++utilities' 'qt5-base')
makedepends=('cmake' 'qt5-tools')
optdepends=("$pkgname-doc: API documentation")
url="https://github.com/Martchus/${_reponame}"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz"
        "0001-Fix-missing-includes.patch::https://github.com/Martchus/${_reponame}/commit/571c2f8a268cf1382bc66d3783a2cc6977c53955.patch")
sha256sums=('b0330de29dbf4878f2681417c6b632a98a04369134998cff1f34a4377fe1493f'
            'f4e1c23b92b89dbd105a9bcbb0cb38b4776ebcb381543508300831348f94d4c0')

prepare() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  patch -Np1 -i "$srcdir/0001-Fix-missing-includes.patch"
}

build() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="/usr"
  make
}

package() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  make DESTDIR="${pkgdir}" install
}
