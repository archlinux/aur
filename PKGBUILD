# Maintainer: Serene-Arc <https://aur.archlinux.org/account/serene-arc>

_pkgname="bulk-downloader-for-reddit"
pkgname=python-bdfr-git
pkgver=2.6.2.r0.g8c293a4
pkgrel=1
pkgdesc="Bulk downloader for Reddit from development branch"
conflicts=('python-bdfr')
provides=('python-bdfr')
arch=('any')
url="https://github.com/aliparlakci/bulk-downloader-for-reddit"
depends=(
    'python'
    'python-appdirs'
    'python-beautifulsoup4'
    'python-dict2xml'
    'python-pip'
    'python-praw'
    'python-yaml'
    'yt-dlp'
)
makedepends=(
	'git'
	'python-build'
	'python-installer'
	'python-wheel'
    'python-setuptools'
)
license=('GPL3')
source=("$_pkgname::git+https://github.com/aliparlakci/bulk-downloader-for-reddit.git#branch=development")
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_pkgname"
    python -m build --wheel --no-isolation
}

package() {
	cd "$_pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
