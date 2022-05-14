# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname=quicklogic-fasm
pkgname="python-$_pkgname-git"
pkgver=r56.fafa623
pkgrel=1
pkgdesc="Tools, scripts and resources for generating a bitstream from FASM files for QuickLogic FPGAs"
arch=(any)
url="https://github.com/antmicro/$_pkgname"
license=('Apache')
depends=('python' 'python-fasm' 'python-quicklogic-fasm-utils')
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
