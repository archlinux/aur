# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
_pkgname=chibitracker
pkgname=chibitracker-git
pkgver=1.4.2.r28.735cf51
pkgrel=2
epoch=
pkgdesc="A Classic Impulse Tracker Clone"
arch=("x86_64" "i686")
url="https://github.com/reduz/chibitracker"
license=('GPL2')
provides=("chibitracker")
conflicts=("chibitracker")
depends=("sdl" "gcc-libs")
makedepends=("scons" "gcc" "git")
source=("git+$url" 
	"chibitracker.desktop")
sha256sums=('SKIP'
            '1ac899721be363f141ccfa248935bed50cd549dd2f5d9ff2ac0c4690e2c1a5f2')
validpgpkeys=()

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "1.4.2.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	SCONSFLAGS="-j$(nproc)" scons target=release prefix="$pkgdir/usr"
}

package() {
	cd "$_pkgname"
	scons target=release prefix="$pkgdir/usr" install

	install -Dm644 "$srcdir/$_pkgname/program/cticon.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/chibitracker.png"
	install -Dm644 "$srcdir/${_pkgname}.desktop" "$pkgdir/usr/share/applications/chibitracker.desktop"

}
