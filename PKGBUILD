# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname='python-reqif'
_name=${pkgname#python-}
pkgver='0.0.41'
pkgrel=1
pkgdesc="Python library for ReqIF format. ReqIF parsing and unparsing."
url="https://github.com/strictdoc-project/reqif"
depends=('python-jinja' 'python-toml' 'python-lxml' 'python-beautifulsoup4')
makedepends=('python-setuptools')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('9834f134fb8dc8199f5a597c231a645a0243eb76abd4b010a0e1de78369713ff')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	#install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
}
