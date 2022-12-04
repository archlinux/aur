# Maintainer: @RubenKelevra <cyrond@gmail.com>
# Contributor: Jose Riha <jose1711 [at] gmail (dot) com>

pkgname=ratarmount
pkgver=0.12.0
pkgrel=1
pkgdesc="Mount tar file using fuse with fast read-only random access"
arch=(any)
url="https://github.com/mxmlnkn/$pkgname"
conflict=("${_pkgname}-git")
license=('MIT')
depends=(
	'python-msgpack'
	'python-rapidjson'
	'python-ujson'
	'python-simplejson'
	'python-fusepy'
)
makedepends=(
        'python-setuptools'
)
optdepends=(
	'python-indexed-gzip: Support for gzip-compressed tar files'
	'python-indexed-zstd: Support for zstd-compressed tar files'
	'python-indexed-bzip2: Support for bzip2-compressed tar files'
	'python-rarfile: Support for rar-compressed tar files'
)
_pkg_ext='.tar.gz'
source=("${pkgname}-${pkgver}${_pkg_ext}::${url}/archive/refs/tags/v${pkgver}${_pkg_ext}")
b2sums=('ee9130add5243f4fff398d05995cda22cb3546ac78faeadac3589b404bb52d74a17628f99626c4c2636fa9ae23d694d4f2d939a9ac51e6325390edd88789a338')

build() {
	cd "$srcdir/${pkgname}-${pkgver}/core"
        python setup.py build
	cd "$srcdir/${pkgname}-${pkgver}"
        python setup.py build
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}/core"
        python setup.py install --root="$pkgdir" --optimize=1
	cd "$srcdir/${pkgname}-${pkgver}"
        python setup.py install --root="$pkgdir" --optimize=1
        install -Dm755 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
        install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
