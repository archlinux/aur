# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Peter Lewis <plewis@aur.archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Panagiotis Papadopoulos <pano_90 AT gmx DOT net>

pkgname=rekonq
pkgver=2.4.2
pkgrel=6
pkgdesc='A WebKit based web browser for KDE'
arch=('i686' 'x86_64')
url='http://rekonq.kde.org/'
license=('GPL')
depends=('kdebase-keditbookmarks' 'qoauth-qt4')
makedepends=('cmake' 'automoc4')
optdepends=('kdebase-konqueror: search engines support')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.xz"
        'with-nepomuk.patch')
sha256sums=('e9805b32f592ca5809bd1632c624c57fc0109ce98b73a8b8e3ebd04e9c875126'
            '19db70a6c9d3b323b58e07f4ca5b6193a2bd0fcba87c86019ea0f78987a22c69')

prepare() {
  mkdir build

  cd ${pkgname}-${pkgver}
  patch -p1 -i "${srcdir}"/with-nepomuk.patch
}

build(){
  cd build
  cmake ../${pkgname}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_NEPOMUK=OFF
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
