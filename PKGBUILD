pkgname='python-dokuwikidumper'
pkgver='0.2.1'
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
sha256sums=('7fbaa0462c66550a0bf7eb263f34b33cf239724ccec1679a7abb720c4b20f7b2')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
