# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: archtux <antonio dot arias99999 at gmail dot com>

pkgname=danbooru-client
pkgver=0.6.1
pkgrel=1
pkgdesc="Application to access Danbooru-based image boards."
arch=('x86_64')
url='http://www.dennogumi.org/projects/danbooru-client'
license=('GPL3')
depends=('kdeclarative'
         'kfilemetadata'
         'qt5-declarative'
         )
makedepends=('extra-cmake-modules'
             'kdoctools'
             'python'
             )
source=("https://www.dennogumi.org/releases/danbooru-client-${pkgver}.tar.xz"
        'https://github.com/lbeltrame/danbooru-client/raw/master/danbooru/img/logo.png'
        )
sha256sums=('bbdde0bba5a6ad13b7f7db31a94f0a846dbb7c6497f1d75c162d2ece071d14be'
            '395a907c61a3450e22a695f6d5e04bf3fbaf3342b02474ba401acbd595609b8b'
            )

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake "../danbooru-client-${pkgver}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF

  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
  install -Dm644 logo.png "${pkgdir}/usr/share/pixmaps/danbooru.png"
  sed 's|Icon=danbooru_client|Icon=danbooru|g' -i "${pkgdir}/usr/share/applications/"*.desktop
}
