# Maintainer: Otreblan <otreblain@gmail.com>

# Remember to activate multilib for proton.
# It's dependencies requiere to be build in this order:
# wine -> vkd3d-valve -> wine-valve -> proton
pkgname=legendary
pkgver=0.20.33
pkgrel=4
pkgdesc="A free and open-source replacement for the Epic Games Launcher "
arch=('any')
url="https://github.com/derrod/legendary"
license=('GPL3')
groups=()
depends=(
	"python-filelock"
	"python-requests"
)
makedepends=(
	"python-build"
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
sha256sums=('b20b190b6cccbde46f394eb970c30e056f01aa1bf44eb936c927cb38926bd150')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	python -m installer --destdir="$pkgdir" dist/*.whl
}
