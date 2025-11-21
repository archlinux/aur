pkgname='python-dokuwikidumper'
pkgver='0.2.4'
_src_folder=${pkgname#python-}-$pkgver
pkgrel=1
pkgdesc="A tool for archiving DokuWiki"
url="https://github.com/saveweb/dokuwiki-dumper"
depends=(
	'python'
	'python-lxml'
	'python-requests'
	'python-internetarchive'
	'python-rich'
	'python-beautifulsoup4'
	'python-slugify'
	'7zip'
	'python-typing_extensions'
)
makedepends=(
	'python-build'
	'python-installer'
	'python-wheel'
	'python-pdm-backend'
)
license=('GPLv3')
arch=('any')
source=("https://pypi.io/packages/source/${_src_folder::1}/${pkgname#python-}/${_src_folder}.tar.gz")
sha256sums=('7725450d3e917a09d0c6776124b5612386ea62221a5f25774a7f57eaec564026')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
