# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname=qlf_fasm
_repo_name=ql_fasm
pkgname="$_pkgname-git"
pkgver=r44.e5d0915
pkgrel=1
pkgdesc="FASM to/from bitstream converter for QuickLogic qlf FPGA device family"
arch=(any)
url="https://github.com/QuickLogic-Corp/$_repo_name"
license=('Apache')
depends=('python' 'python-fasm')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_repo_name"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_repo_name"

	python -m build --wheel --no-isolation
}

package() {
	cd "$_repo_name"

	python -m installer --destdir="$pkgdir" dist/*.whl

	install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
