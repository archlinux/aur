# Maintainer: @RubenKelevra <rubenkelevra@gmail.com>
# Contributor: devome <evinedeng@hotmail.com>

_pkgname='compressed_rtf'
pkgname="python-${_pkgname//_/-}"
pkgver=1.0.7
pkgrel=2
pkgdesc='Compressed Rich Text Format (RTF) compression and decompression'
arch=('any')
url="https://github.com/delimitry/${_pkgname}"
license=('MIT')
depends=('python')
makedepends=(
	'python-build'
	'python-installer'
	'python-setuptools>=1:77.0.0'
)
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('54e87a92047bd8b13b91326328701e3ab885f828d86babae6294c6e3a707e983900c87989f26b7982d7f4d643f5626c50cf831c77c9c03a08b1a5b1bc96d1324')

build() {
	cd -- "${srcdir}/${_pkgname}-${pkgver}" || return 1
	python -m build --wheel --no-isolation
}

check() {
	cd -- "${srcdir}/${_pkgname}-${pkgver}" || return 1
	PYTHONPATH="${srcdir}/${_pkgname}-${pkgver}/build/lib" \
		python -P -m unittest discover -s tests -v
}

package() {
	cd -- "${srcdir}/${_pkgname}-${pkgver}" || return 1
	python -m installer --destdir="${pkgdir}" --compile-bytecode 2 dist/*.whl
	install -Dm644 -- 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
