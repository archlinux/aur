# Maintainer: Agil Mammadov <mammadovagil@tutamail.com>
_name=docstring_parser
pkgname="python-${_name/_/-}"
pkgdesc="Parse Python docstrings"
pkgver=0.17.0
pkgrel=1
depends=('python')
arch=(any)
url="https://github.com/rr-/docstring_parser"
license=(MIT)
depends=('python-pytest')
makedepends=('python-build' 'python-installer' 'python-hatchling')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('583de4a309722b3315439bb31d64ba3eebada841f2e2cee23b99df001434c912')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	install -Dm644 LICENSE.md -t "${pkgdir}/usr/share/licenses/$pkgname/LICENSE.md"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
