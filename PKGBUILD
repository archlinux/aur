pkgname='python-dokuwikidumper'
pkgver=0.2.5
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
	'python-uv-build'
	'python-ruff'
	'python-pytest'
)
license=('GPLv3')
arch=('any')
source=("https://pypi.io/packages/source/${_src_folder::1}/${pkgname#python-}/${_src_folder}.tar.gz")
sha256sums=('093f6f84506822cccde394d479dc1d5a07bf32a6b6be2ef457ac5e6212b30eb8')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
