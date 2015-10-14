# Maintainer: Pierre Neidhardt <ambrevar@gmail.com>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: botika <aritmeeul@gmail.com>
# Contributor: portix <portix@gmx.net>

_pkgname=dwb
pkgname=$_pkgname-git
pkgver=2015.07.26.gdda5aa7
pkgrel=1
pkgdesc="A webkit web browser with vi-like keyboard shortcuts"
arch=("i686" "x86_64")
url="http://portix.bitbucket.org/dwb"
license=("GPL")
depends=("webkitgtk2" "desktop-file-utils")
makedepends=("git" "json-c")
provides=("dwb")
conflicts=("dwb" "dwb-gtk3-git" "dwb-gtk3" "dwb-gtk3-hg" "dwb-hg")
install="dwb.install"
source=("git+https://portix@bitbucket.org/portix/dwb.git")
md5sums=("SKIP")

pkgver() {
	cd "$srcdir/$_pkgname"
	git log -1 --format="%cd.g%h" --date=short | sed 's/-/./g'
}

build() {
	cd "$srcdir/$_pkgname"
	make
}

package() {
	cd "$srcdir/$_pkgname"
	make DESTDIR="$pkgdir" install \
		BASHCOMPLETION=/usr/share/bash-completion/completions
}
