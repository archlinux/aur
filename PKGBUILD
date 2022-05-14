# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname=quicklogic-fasm-utils
pkgname="python-$_pkgname-git"
pkgver=r13.3d6a375
pkgrel=1
pkgdesc="A set of tools for creating FASM assemblers for the Symbiflow project"
arch=(any)
url="https://github.com/QuickLogic-Corp/$_pkgname"
license=('Apache')
depends=('python' 'python-fasm')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
provides=("python-$_pkgname=$pkgver")
conflicts=("python-$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"

	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkgname"

	python -m installer --destdir="$pkgdir" dist/*.whl

	install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
