pkgname='python-pukiwikidumper'
pkgver='0.0.19'
_src_folder=${pkgname#python-}-$pkgver
pkgrel=1
pkgdesc="A tool for archiving PukiWiki"
url="https://github.com/saveweb/pukiwiki-dumper"
depends=(
	'python'
	'python-requests'
	'python-beautifulsoup4'
	'python-internetarchive'
	'python-rich'
	'python-slugify'
	'python-chardet'
	'7zip'
)
makedepends=(
	'python-build'
	'python-installer'
	'python-wheel'
	'python-poetry-core'
)
license=('GPLv3')
arch=('any')
source=("https://pypi.io/packages/source/${_src_folder::1}/${pkgname#python-}/${_src_folder}.tar.gz")
sha256sums=('6ed9e0370aa3cc7d205d5378d614fb05a8aba51be6fc8292cbd466c428928fd1')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
