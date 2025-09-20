pkgname='python-dokuwikidumper'
pkgver='0.2.2'
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
sha256sums=('a5b7277603c4c6bb115e6a0e1dd53ccb84a9b87578028acb42382e1962206f5e')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
