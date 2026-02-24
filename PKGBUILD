# Maintainer: nathan marchiori <nathan.marchiori@gmail.com>
pkgname="python-aw-client"
_name=${pkgname#python-}
pkgver=0.5.15
pkgrel=1
pkgdesc="Client library for ActivityWatch in Python"
arch=("any")
url="https://github.com/ActivityWatch/aw-core"
license=('MPL-2.0')
depends=()
makedepends=(python-build python-installer git poetry)
provides=(aw-client)
source=("$_name::git+https://github.com/ActivityWatch/aw-client")
sha256sums=("SKIP")

pkgver() {
	cd "$_name"
	printf "%s" "$(poetry version | awk '{print $NF}')"
}

build() {
	cd "$_name"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
