# Maintainer: RubenKelevra
# Contributor: Jose Riha <jose1711 [at] gmail (dot) com>

pkgname=ratarmount
pkgver=0.11.2
pkgrel=3
pkgdesc="Mount tar file using fuse with fast read-only random access"
arch=(any)
url="https://github.com/mxmlnkn/ratarmount"
conflict=(ratarmount-git)
license=(MIT)
depends=(python-fusepy python-msgpack python-rapidjson python-ujson python-simplejson python-fuse)
optdepends=('python-indexed-gzip: Support for gzip-compressed tar files')
_pkg_ext='.tar.gz'
source=("${pkgname}-${pkgver}${_pkg_ext}::${url}/archive/refs/tags/v${pkgver}${_pkg_ext}")
b2sums=('697dce804f4b01407da4f17c59972927fa1366753dc3548e767a45b51d7fbba539f8dafc6514d08ddff4259830e2e23ad6f92d96fb029b9f1c6629a1d17e3d73')

build() {
  cd $srcdir/${pkgname}-${pkgver}
  python setup.py build
}


package() {
  cd $srcdir/${pkgname}-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm755 'README.md' "${pkgdir}/usr/share/doc/ratarmount/README.md"
}

