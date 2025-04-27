# Maintainer: Kimiblock Moe
pkgname=portable-git
pkgver=2.19.r9.g5683f225
pkgrel=1
epoch=
pkgdesc="Portable Sandboxing framework"
arch=('any')
url="https://github.com/Kraftland/portable"
license=(GPL-3.0-or-later)
provides=(portable)
conflicts=(portable)
groups=()
options=(!debug !strip)

makedepends+=(git)

depends=(
	"procps-ng"
	"coreutils"
	"awk"
	"xxd"
	"xorg-xauth"
	"xdg-user-dirs"
	"xorg-xhost"
	"zenity"
	"xdg-dbus-proxy"
	"nss"
	"bubblewrap"
	"util-linux"
	"libxcb"
	"nspr"
	"zlib"
	"glib2"
	"wayland"
	"dbus"
	"bash"
	"lsb-release"
	"psmisc"
	"flatpak-xdg-utils"
	"xdg-desktop-portal"
	"xdg-desktop-portal-impl"
	"inotify-tools"
)

optdepends=(
	'at-spi2-core: accessibility'
	'orca: screen reader'
)

makedepends+=(
	"libarchive"
)

checkdepends=()

source=(
	"git+https://github.com/Kraftland/portable.git"
)

function pkgver() {
	cd "${srcdir}/portable"
	git describe --long --tags --abbrev=8 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
	#printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

function package() {
	cd portable
	install -Dm755 portable.sh ${pkgdir}/usr/bin/portable
	install -Dm755 open.sh ${pkgdir}/usr/lib/portable/open
	install -Dm755 flatpak-info ${pkgdir}/usr/lib/portable/flatpak-info
	install -Dm755 bwrapinfo.json ${pkgdir}/usr/lib/portable/bwrapinfo.json
	install -Dm755 portable-helper.sh ${pkgdir}/usr/lib/portable/helper
	install -Dm755 portable-pools ${pkgdir}/usr/bin/portable-pools
}
sha256sums=('SKIP')
