# Maintainer: Agil Mammadov <mammadovagil@proton.me>
# Contributor: Alex Hirzel <alex at hirzel period us>

pkgname='python-strictdoc'
_name=${pkgname#python-}
pkgver=0.25.1
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
sha512sums=('1130f2dc97812f880dd04cda4c0d7833d6639a4cadcb7e6832ac9c09fbda7ff447e00a41cf5651906a881a86fed9fbbb331c9b51d2c77e38e8315af36fc3882c')

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
