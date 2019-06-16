# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=kde-thumbnailer-odf
_pkgname=kde-odf-thumbnail
pkgver=1.0.0
pkgrel=3
pkgdesc="Thumbnailer to show ODF (OpenDocument Format) previews in KDE file managers"
arch=(x86_64 i686 armv7h)
url="http://kde-apps.org/content/show.php?content=110864"
license=(LGPL3)
depends=(kio)
makedepends=(extra-cmake-modules)
source=("http://mirror.rosalab.ru/rosa/rosa2016.1/repository/SRPMS/contrib/release/${_pkgname}-$pkgver-7.src.rpm"
        port-to-kf5.patch)
sha512sums=('e7facf6ccdaebc21aea6554c3ca8967f79ed47d9b2cbeca410b2870b3bd424eac2199a9663af865b724b5adb401b59095950e78c5c67744d7cdfa4a245e1ef58'
            '825b6286ec9f14db1539ca4d424d480d5518e3176eb7ec0d5af2d379bfc15eb68cf6b0cb88535eeaedbdedeb879194c1ec5339f5e8d9de2291bf5b20c769feec')

prepare() {
  bsdtar -zxvf $_pkgname-$pkgver.tar.gz
  cd "${_pkgname}-${pkgver}"
  patch -p1 -i ../port-to-kf5.patch
}

build() {
  cd "${_pkgname}-${pkgver}"
  cmake . \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  make -C "${_pkgname}-${pkgver}" DESTDIR="${pkgdir}" install
}
