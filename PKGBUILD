# Maintainer: Kimiblock Moe
pkgname=portable-unstable
epoch=1
pkgver=18.beta
pkgrel=1
epoch=1
pkgdesc="Fast, private, efficient sandbox for Linux desktop. Unstable beta versions."
arch=('x86_64' 'aarch64' 'loongarch64')
url="https://github.com/Kraftland/portable"
license=(GPL-3.0-or-later)
provides=(portable)
groups=()
options=()

depends=(
	libseccomp
	"libnotify"
	pipewire
	"coreutils"
	"zenity"
	"xdg-dbus-proxy"
	"bubblewrap"
	"util-linux"
	"glibc"
	"dbus"
	"bash"
	"xdg-desktop-portal-impl"
	"grep"
	"systemd-libs"
	"portable-packer"
)

optdepends=(
	'at-spi2-core: accessibility'
	'orca: screen reader'
	'netsock: Per-app firewall'
	'stashpak: Install Portable packages with ease'
	'bawn: Transient sandbox generator'
)

makedepends+=(
	"libarchive"
	"git"
	"go"
	"rust"
)

checkdepends=()

source=(portable::git+https://github.com/Kraftland/portable.git#tag=${pkgver})

md5sums=('800ebfe0d1503311fec40c88b3d6f5b5')

function build() {
	cd "${srcdir}/portable"
	export srcdir
	lib/build.sh
}

function package() {
	export srcdir
	export pkgdir
	cd "${srcdir}/portable"
	lib/package.sh

	rm "${pkgdir}/usr/bin/portable-packer" || true
}
