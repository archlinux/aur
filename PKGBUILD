# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Pellegrino Prevete <pellegrinoprevete@gmail.com>

## this package requires vamp-plugin-sdk source files for whatever reason

pkgname=vampy-host-git
pkgver=1.0.2.r12.gb43546b
pkgrel=2
pkgdesc="Wrapper plugin that enables you to use Python Vamp in any Vamp host."
arch=('x86_64' 'i686' 'pentium4')
url="https://github.com/vamp-plugins/vampy-host"
license=('MIT')
depends=('python-numpy')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
	"$pkgname::git+$url"
	"vamp-plugin-sdk-2.10.tar.gz::https://github.com/vamp-plugins/vamp-plugin-sdk/archive/vamp-plugin-sdk-v2.10.tar.gz")
sha256sums=('SKIP'
            'b552bc91817294c7f90ea07d70938642ebf15d5e3bafc81cf7d55efab9995399')

prepare() {
	mv "$srcdir/vamp-plugin-sdk-vamp-plugin-sdk-v2.10/" "$srcdir/$pkgname/vamp-plugin-sdk"
}

pkgver() {
	cd "$pkgname"
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
	cd "$pkgname"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
