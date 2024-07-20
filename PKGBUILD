# Maintainer: @RubenKelevra <cyrond@gmail.com>

pkgname='python-dirhash'
_module=${pkgname#python-}
pkgver='0.4.1'
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
b2sums=('221109970c686bb1af9048028d592c30238a92fec7fce4cadad3dab94f03db262d90d682a33222b32f299e553a2f70eb6ff5f5bf0ba37e96e2d08468ed317ab8')

build() {
	cd "${srcdir}/${_module}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_module}-${pkgver}"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/python-dirhash/LICENSE"
	python -m installer --compile-bytecode=2 --destdir="${pkgdir}" dist/*.whl
}
