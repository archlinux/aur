
_name=docstring_parser
pkgname="python-${_name/_/-}"
pkgdesc="Parse Python docstrings"
pkgver=0.16
pkgrel=1
depends=('python')
arch=(any)
url="https://github.com/rr-/docstring_parser"
license=(MIT)
depends=('python-pytest')
makedepends=('python-build' 'python-installer')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('538beabd0af1e2db0146b6bd3caa526c35a34d61af9fd2887f3a8a27a739aa6e')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	install -Dm644 LICENSE.md -t "${pkgdir}/usr/share/licenses/$pkgname/LICENSE.md"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
