# Maintainer: Otreblan <otreblain@gmail.com>

# Remember to activate multilib for proton.
# It's dependencies requiere to be build in this order:
# wine -> vkd3d-valve -> wine-valve -> proton
pkgname=legendary
pkgver=0.21.1
pkgrel=1
pkgdesc="A free and open-source replacement for the Epic Games Launcher "
arch=('any')
url="https://github.com/legendary-gl/legendary"
license=('GPL-3.0-or-later')
groups=()
depends=(
	"python"
	"python-filelock"
	"python-pycryptodomex"
	"python-requests"
)
makedepends=(
	"python-build"
	"python-installer"
	"python-uv-build"
	"python-wheel"
)
checkdepends=()
optdepends=(
	"proton: Windows binaries support"
	"python-pywebview: Login support"
)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
noextract=()
sha256sums=('b78e6dc73d859a324b228ea28839d06fc0561c7143c3d0838e00cba992643f57')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"

	sed -i 's/\(uv_build>=.*\),<[^"]*/\1/' pyproject.toml
}

build() {
	cd "$srcdir/$pkgname-$pkgver"

	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	python -m installer --destdir="$pkgdir" dist/*.whl
}
