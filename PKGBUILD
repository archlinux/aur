# Original Maintainer: Lantald  <lantald at Gmx dot com>
# Maintainer: Danilo <aur at dbrgn dot ch>

pkgname=spatialindex
pkgver=1.8.4
pkgrel=1
pkgdesc='An extensible framework that supports robust spatial indexing methods and sophisticated spatial queries.'
arch=('i686' 'x86_64')
url="http://libspatialindex.github.com/"
license=('MIT')
depends=(gcc-libs)
provides=(spatialindex)
conflicts=(libspatialindex-git)
source=("http://download.osgeo.org/libspatialindex/$pkgname-src-$pkgver.tar.gz"
        'LICENSE')
md5sums=('b17f86d9a49f284fe403c19b36fb5d89'
         '6a9a7d8158edbf1529ca46aae5a76752')

build() {
  cd "$srcdir/$pkgname-src-$pkgver/"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname-src-$pkgver/"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-src-$pkgver/"
  make DESTDIR="$pkgdir/" install
  install -D -m644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
