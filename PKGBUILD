# Maintainer: Agil Mammadov <mammadovagil@tutamail.com>
# Contributor: Alex Hirzel <alex at hirzel period us>

pkgname='python-strictdoc'
_name=${pkgname#python-}
pkgver=0.21.1
pkgrel=1
pkgdesc="Software for technical documentation and requirements management."
url="https://github.com/strictdoc-project/strictdoc"
depends=(
	'python'
	'python-typing_extensions'
	'python-lark-parser'
	'python-pandas'
	'python-coverage'
	'python-markdown-it-py'
	'python-markupsafe'
	'python-starlette'
	'python-beautifulsoup4'
	'python-datauri'
	'python-docutils'
	'python-fastapi'
	'python-jinja'
	'python-lxml'
	'python-pygments'
	'python-reqif'
	'python-semantic-version'
	'python-spdx-tools'
	'python-textx'
	'python-toml'
	'python-tree-sitter'
	'python-xlrd'
	'python-xlsxwriter'
	'uvicorn'
)
optdepends=(
	'python-graphviz'
	'python-webdriver-manager'
)
makedepends=('python-pipreqs' 'python-setuptools')
license=('Apache-2.0')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('20eaebb11431a89801040ab429f49bf42fc2f5c1236f835f913924902fe912b4fd34a8ae49c5014b24cf43788ce6cc0cb05e33c5ecb1cb0749e49701707f5145')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl

	# not sure why these end up in the wrong spot...
	local _site=$(python -c "import site; print(site.getsitepackages()[0])")
	mv \
		"${pkgdir}${_site}/LICENSE" \
		"${pkgdir}${_site}/NOTICE" \
		"${pkgdir}${_site}/README.md" \
		"${pkgdir}${_site}/pyproject.toml" \
			"${pkgdir}${_site}/${_name}"
}
