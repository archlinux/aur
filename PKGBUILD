# Maintainer: fnrir <fnr1r0@protonmail.com>
pkgname=vscodium-prod-patcher
pkgver=1.0.1
pkgrel=1
epoch=
pkgdesc="Universal patcher for VSCodium"
arch=(any)
url="https://github.com/fnr1r/$pkgname"
license=('GPL')
groups=()
depends=(
	vscodium
	python-toml
)
makedepends=(
	python-build python-installer python-wheel
	python-hatchling
)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!debug)
install=
changelog=
source=(
	"git+$url#tag=v$pkgver"
	vscodium-prod-patcher.hook.in
)
noextract=()
sha256sums=(
	SKIP
	0b3c4a42ba232ece67c2cb9a6004b907fc1cec2244286350409a380a180ae5d8
)
validpgpkeys=()

build() {
	sed -E "s|@PACKAGE_NAME@|$pkgname|" \
		< vscodium-prod-patcher.hook.in \
		> vscodium-prod-patcher.hook
	cd "$pkgname"
	python -m build --wheel --no-isolation
}

package() {
	python -m installer --destdir="$pkgdir" "$pkgname/dist"/*.whl
	install -Dm 644 vscodium-prod-patcher.hook \
		"$pkgdir/usr/share/libalpm/hooks/97-vscodium-prod-patcher-self.hook"
}
