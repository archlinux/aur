# Maintainer: Fabien Devaux <fdev31@gmail.com>
# Contributor: Fabien Devaux <fdev31@gmail.com>
pkgname=ynot3
pkgver=1.2.1
pkgrel=2
pkgdesc="An image annotator for Xorg & Wayland using pygame"
arch=(any)
url="https://github.com/fdev31/${pkgname}"
license=('MIT')
groups=()
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-poetry')
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=()
backup=()
options=()
install=
source=(git+"https://github.com/fdev31/${pkgname}.git#tag=${pkgver}")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git checkout ${pkgver}
	printf "%s" "$(git describe --tags)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
    python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/${pkgname%-git}"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
