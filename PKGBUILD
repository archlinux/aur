pkgname=nyaadownloader-git
_pkgname=${pkgname%-git}
pkgver=r62.268890d
pkgrel=1
pkgdesc="A tool to download multiple torrents or transfer magnets from Nyaa.si"
url="https://github.com/p0358/nyaadownloader"
depends=('python>=3.9' 'python-requests' 'python-nyaapy' 'libnotify' 'qt6-base' 'python-pyqt6')
makedepends=('python-setuptools')
provides=($_pkgname)
conflicts=($_pkgname)
license=('MIT')
arch=('any')
source=("$_pkgname::git+${url}.git")
sha256sums=(SKIP)

pkgver() {
	cd "$_pkgname"
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
