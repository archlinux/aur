# Maintainer: Alexander 'z33ky' Hirsch <1zeeky@gmail.com>
# Maintainer: Oleg Plakhotniuk <olegus8@gmail.com>

pkgname=btogre
pkgver=6266297
pkgrel=1
pkgdesc='A thin Bullet-Ogre connection.'
arch=('i686' 'x86_64')
url='http://www.ogre3d.org/forums/viewtopic.php?f=5&t=46856'
license=('zlib')
depends=('bullet' 'ogre')
makedepends=('git' 'cmake' 'boost')
source=("git://github.com/nikki93/${pkgname}.git#commit=${pkgver}" 'cmake-targets.patch' 'BtOgre.cpp.patch')
md5sums=('SKIP'
         '04de7ba58a645b96739e50092ae7a067'
         'b46331fc6ef646bc37426f3fe62f04c1')
sha1sums=('SKIP'
          'b705573e40bf33f3ee76f08ebead2b67f577fa4c'
          '23c30bcff53457d4f0c76ce757830bb46d0afbbe')

prepare() {
  cd "${srcdir}/${pkgname}"

  patch -Np1 -i "${srcdir}/cmake-targets.patch"
  patch "${srcdir}/${pkgname}/BtOgre.cpp" "${srcdir}/BtOgre.cpp.patch"
}

build() {
  cd "${srcdir}/${pkgname}"

  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}"

  make DESTDIR="${pkgdir}" install
}
