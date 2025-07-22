# Maintainer: @RubenKelevra <cyrond@gmail.com>

pkgname='python-dirhash'
_module=${pkgname#python-}
pkgver='0.5.0'
pkgrel=1
pkgdesc="Python module and CLI for hashing of file system directories."
url="https://github.com/andhus/dirhash-python"
depends=(
	'python>=3.12'
)
makedepends=(
        'python-build'
        'python-installer'
        'python-wheel'
	'python-versioneer'
)
license=('MIT')
arch=('any')
source=("${url}/releases/download/v${pkgver}/${_module}-${pkgver}.tar.gz")
b2sums=('3c2e8dc652d212ca267fc7843e19ced4383ca60f8abc7a7bc36e210d821ea425b34dc3aa2b97bfe3e46a9de8448194818c658653c66dbad99a3bef72d8912e9b')

build() {
	cd "${srcdir}/${_module}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_module}-${pkgver}"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/python-dirhash/LICENSE"
	python -m installer --compile-bytecode=2 --destdir="${pkgdir}" dist/*.whl
}
