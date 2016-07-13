# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=kde-thumbnailer-odf
_pkgname=kde-odf-thumbnail
pkgver=1.0.0
pkgrel=1
pkgdesc="Thumbnailer to show odf previews in KDE file managers."
arch=('x86_64' 'i686')
url="http://kde-apps.org/content/show.php?content=110864"
license=('LGPL3')
depends=('kio')
makedepends=('extra-cmake-modules')
source=("http://kenai.com/projects/${_pkgname}/downloads/download/${pkgver}/${_pkgname}-${pkgver}.tar.gz"
        'port-to-kf5.patch')
sha512sums=('569f36a13981d87d7f21081de26b5329ebd3aaa4b85a75094e192935ca2e780c39005693eb0f237409859a02bcb547835f97cff92b55b5e99d19f3a3d3428fd4'
            '825b6286ec9f14db1539ca4d424d480d5518e3176eb7ec0d5af2d379bfc15eb68cf6b0cb88535eeaedbdedeb879194c1ec5339f5e8d9de2291bf5b20c769feec')

prepare() {
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
