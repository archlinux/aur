# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname=quicklogic-timings-importer
pkgname="$_pkgname-git"
pkgver=r75.eec0737
pkgrel=2
pkgdesc="Importer of timing data from Quicklogic EOS-S3 to SDF"
arch=(any)
url="https://github.com/QuickLogic-Corp/$_pkgname"
license=('Apache')
depends=('python' 'python-termcolor' 'python-sdf-timing')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
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
