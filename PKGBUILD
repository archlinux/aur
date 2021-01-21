# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname=TinyFPGA-B-Series
pkgname=python-tinyfpgab-git
pkgver=r80.e8f9150
pkgrel=1
pkgdesc="Programmer for the TinyFPGA B2 boards"
arch=(any)
url="https://github.com/tinyfpga/TinyFPGA-B-Series"
license=('GPL')
depends=('python' 'python-pyserial')
makedepends=('git' 'python-setuptools')
checkdepends=('python-pytest')
provides=("${pkgname%%-git}")
conflicts=("${pkgname%%-git}")
source=("git+$url.git")

sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname/programmer"

	python setup.py build
}

check() {
	cd "$_pkgname/programmer"

	pytest test.py
}

package() {
	cd "$_pkgname/programmer"

	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
