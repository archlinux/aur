pkgname='python-wikiteam3'
pkgver='4.4.5'
_src_folder=${pkgname#python-}-$pkgver
pkgrel=1
pkgdesc="Tools for downloading and preserving MediaWikis. We archive MediaWikis, from Wikipedia to tiniest wikis."
url="https://github.com/saveweb/wikiteam3"
depends=(
	'python'
	'python-requests'
	'python-internetarchive'
	'python-lxml'
	'python-mwclient'
	'python-file-read-backwards'
	'python-slugify'
	'7zip'
	'zstd'
)
makedepends=(
	'python-build'
	'python-installer'
	'python-wheel'
	'python-pdm-backend'
)
license=('GPL-3.0-or-later')
arch=('any')
source=("https://pypi.io/packages/source/${_src_folder::1}/${pkgname#python-}/${_src_folder}.tar.gz")
sha256sums=('62321edfceb4bd2e64a3f9b18fce800eb4c1e75b745a3356de6799cd12c87139')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
