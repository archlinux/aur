# Maintainer: @RubenKelevra <cyrond@gmail.com>
# Contributor: Jose Riha <jose1711 [at] gmail (dot) com>

pkgname=ratarmount
pkgver=0.11.3
pkgrel=3
pkgdesc="Mount tar file using fuse with fast read-only random access"
arch=(any)
url="https://github.com/mxmlnkn/ratarmount"
conflict=(ratarmount-git)
license=(MIT)
depends=(python-msgpack python-rapidjson python-ujson python-simplejson python-fuse)
optdepends=('python-indexed-gzip: Support for gzip-compressed tar files')
_pkg_ext='.tar.gz'
source=("${pkgname}-${pkgver}${_pkg_ext}::${url}/archive/refs/tags/v${pkgver}${_pkg_ext}")
b2sums=('24ce1e522c95d7c77641a505809db66dbbf04b8554b8c1fd9680b8ec600d10316389cd0a87dfa5e6a5c0de24b7747bda4baf1cf82d4f7e6a2fb29ff2110fcde7')

build() {
  cd $srcdir/${pkgname}-${pkgver}
  python setup.py build
}


package() {
  cd $srcdir/${pkgname}-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm755 'README.md' "${pkgdir}/usr/share/doc/ratarmount/README.md"
}

