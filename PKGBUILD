# Maintainer: redponike <proton (dot) me>
# Contributor: Jean-Gabriel Young <info@jgyoung.ca>

pkgname=python-pysimdjson
_pkgname=${pkgname#python-}
pkgver=7.0.0.pre0
pkgrel=1
pkgdesc="Python bindings for the simdjson project, a SIMD-accelerated JSON parser."
arch=('i686' 'x86_64')
url='http://github.com/TkTech/pysimdjson'
license=('MIT')
depends=('cython' 'glibc' 'gcc-libs')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=(
	"git+https://github.com/TkTech/pysimdjson.git#branch=draft_7"
)
sha256sums=(
	'SKIP'
)

# Branch draft_7 builds on the latest version 6.0.2 with PR #124 (for py3.13) as well as an updated simdjson lib.
# We need this for Python 3.13 compatibility. I'll switch to the tarballs as soon as the new version is released.

build() {
	cd ${_pkgname}
	python -m build --wheel --no-isolation
}

package() {
	cd ${_pkgname}
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
