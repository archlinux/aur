# Maintainer: Kimiblock Moe
pkgname=portable-git
pkgver=7.0.rc1.r0.g38283d13
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
	"wayland-utils"
	"pipewire-v4l2"
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
	'socat: Wayland secure context'
	'way-secure: Wayland secure context'
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
}

function package() {
	cd portable
	install -Dm755 portable.sh "${pkgdir}/usr/bin/portable"
#	install -t "${pkgdir}/usr/lib/portable" -Dm755 -D "${srcdir}/portable/lib"/*
#	find ./lib -type f -exec 'install -Dm755 {} "${pkgdir}/usr/lib/portable"' +
	install -d "${pkgdir}/usr/lib/"
	cp -r "${srcdir}/portable/lib" "${pkgdir}/usr/lib/portable" 
	install -t "${pkgdir}/usr/share/portable" -Dm755 "${srcdir}/portable/share"/*
	install -Dm755 portable-pools "${pkgdir}/usr/bin/portable-pools"
}
sha256sums=('SKIP')
