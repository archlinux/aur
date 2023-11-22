# Maintainer: Junxuan Liao <mikeljx at 126 dot com>
_pkgname=xdpss
pkgname=$_pkgname-git
pkgver=r1.b21bfbb
pkgrel=1
pkgdesc="Initiate screencast with the help of XDG Desktop portals"
arch=('any')
url="https://github.com/MikeWalrus/xdpss"
license=('GPL-3.0-only')
depends=('dbus-python' 'python-gobject')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}"
    python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_pkgname}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

