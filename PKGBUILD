# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=gnome-shell-extension-tophat
pkgname="$_pkgbase-git"
pkgver=22.r4.gfca81d7
pkgrel=1
pkgdesc="View CPU, memory, disk, and network activity in the GNOME top bar."
arch=('any')
url="https://github.com/fflewddur/tophat"
license=('GPL-3.0')
optdepends=('networkmanager: to monitor network devices')
makedepends=('git' 'nodejs' 'yarn')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
source=("$_pkgbase::git+https://github.com/fflewddur/tophat.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgbase"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
	cd "$_pkgbase"
	corepack yarn install
}

build() {
	cd "$_pkgbase"
	corepack yarn build
}

package() {
	cd "$_pkgbase"
	mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/tophat@fflewddur.github.io"
	cp -r dist/* "$pkgdir/usr/share/gnome-shell/extensions/tophat@fflewddur.github.io/"
}
