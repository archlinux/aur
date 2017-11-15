# $Id: PKGBUILD 159441 2016-01-30 05:03:01Z fyan $
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Riley Trautman <asonix.dev@gmail.com>
# Contributor: Michael Spencer <sonrisesoftware@gmail.com>

pkgname=liri-files
pkgver=0.1.0
pkgrel=3
pkgdesc="The file manager for Liri"
arch=("x86_64")
url="https://github.com/lirios/files"
license=("GPL")
depends=("fluid" "taglib")
makedepends=("extra-cmake-modules" "qt5-tools")
replaces=('papyros-files')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lirios/files/archive/v$pkgver.tar.gz"
        "fluid-0.10.patch::https://github.com/lirios/files/commit/aadbc5223f2699341aaf580153b823c41ee7a3d8.patch")
sha256sums=('a5d302dcef97735a277473bcbfc3257dcfb444c0ad0be05961e46ca05cf315ae'
            '9dfce5b5957aeb0fe17fed92ded87b86080a89b66338b9907b44d4457e77b124')

prepare() {
  (cd files-$pkgver; patch -p1 -i ../fluid-0.10.patch)
  mkdir -p build
}

build() {
  cd build
  cmake "$srcdir"/files-$pkgver -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
