# Maintainer: Otreblan <otreblain@gmail.com>

# Remember to activate multilib for proton.
# It's dependencies requiere to be build in this order:
# wine -> vkd3d-valve -> wine-valve -> proton
pkgname=legendary
pkgver=0.21.0
pkgrel=2
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
	"python-setuptools"
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
sha256sums=('fffe135163c5033c72f02c176df2d75d31a3a5bb588b81440b0c46a42fcb40aa')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"

	sed -i 's/\(uv_build.*\),<[^"]*/\1/' pyproject.toml
}

build() {
	cd "$srcdir/$pkgname-$pkgver"

	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	python -m installer --destdir="$pkgdir" dist/*.whl
}
