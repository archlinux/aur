# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=remmina-plugin-open
pkgver=1.3.0.0
pkgrel=2
_builderver=1.4.0.0
pkgdesc="A protocol plugin for Remmina to open a document with its associated application."
arch=('x86_64')
url="http://www.muflone.com/${pkgname}/"
license=('GPL')
depends=('gtk3' 'remmina')
makedepends=('pkg-config' 'cmake')
optdepends=('xdg-utils: for Automatically detected option'
            'xpra: for Open for GNOME option')
source=("remmina-plugin-builder_${_builderver}.tar.gz::https://github.com/muflone/remmina-plugin-builder/archive/${_builderver}.tar.gz"
        "${pkgname}_${pkgver}.tar.gz::https://github.com/muflone/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('c640edecf6606d6c5740f7812dc8dabce2b4a813cd48440e8703fe7b5a0488aa'
            'ca74811f31e0c4211c8516f119242bf097e12c1b74e8bb6d085278eb8524afcb')

build() {
  [ -d build ] && rm -rf build
  cp -r "remmina-plugin-builder-${_builderver}" build
  cp -r "${pkgname}-${pkgver}"/* "build/remmina-plugin-to-build"
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DWITH_TRACE_CALLS=OFF .
  make
}

package() {
  cd "${srcdir}/build/"
  make DESTDIR="${pkgdir}" install
}
