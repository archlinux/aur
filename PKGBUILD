# Maintainer: Bart Libert <bart plus aur at liber dot email>
_pkgname=niri-wselector
pkgname=$_pkgname-git
pkgver=r10.1eff068
pkgrel=1
pkgdesc="Quick hack to use fuzzel to select windows and workspaces in niri."
arch=(any)
url="https://github.com/kassick/niri-wselector"
license=('GPL-3.0-only')
depends=('python')
makedepends=(git python-build python-installer python-wheel python-poetry-core)
provides=($_pkgname)
source=(git+$url.git)
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
    cd $_pkgname
    python -m build --wheel --no-isolation
}

package() {
    cd $_pkgname
    python -m installer --destdir="$pkgdir" dist/*.whl
}
