# Maintainer: Steven Guikal <aur-void@fluix.dev>

pkgname=sway-borders-git
_pkgname=sway-borders
pkgver=r6547.a854f050
pkgrel=1
license=("MIT")
pkgdesc="Fork of Sway with some additional (mostly graphical) features"
makedepends=(
	"git"
	"meson"
	"ninja"
	"scdoc"
	"wayland-protocols"
)
depends=(
	"cairo"
	"gdk-pixbuf2"
	"json-c"
	"pango"
	"polkit"
	"pcre"
	"swaybg-git"
	"ttf-font"
	"wlroots-git"
	"xorg-server-xwayland"
)
optdepends=(
	"alacritty: Terminal emulator used by the default config"
	"dmenu: Application launcher"
	"grim: Screenshot utility"
	"i3status: Status line"
	"mako: Lightweight notification daemon"
	"slurp: Select a region"
	"swayidle-git: Idle management daemon for Sway"
	"swaylock-git: Screen locker for Sway"
	"wallutils: Timed wallpapers"
	"waybar: Highly customizable bar"
)
backup=(etc/sway/config)
arch=("i686" "x86_64")
url="https://github.com/fluix-dev/sway-borders"
source=("${pkgname%-*}::git+https://github.com/fluix-dev/sway-borders.git")
sha512sums=("SKIP")
provides=("sway")
conflicts=("sway")
options=(debug)

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$_pkgname"
}

build() {
	cd "$_pkgname"
	meson \
		-Dwerror=false \
		--prefix /usr \
		"$srcdir/build"
	ninja -C "$srcdir/build"
}

package() {
	cd "$_pkgname"
	DESTDIR="$pkgdir" ninja -C "$srcdir/build" install

	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
