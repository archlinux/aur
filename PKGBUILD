# Maintainer: bozidarsk <aaaa@gmail.com>
pkgname=wifi-menu-git
pkgver=1
pkgrel=1
pkgdesc="Gtk3 layer shell window for managing wifi connections."
arch=('x86_64')
url="https://github.com/bozidarsk/wifi-menu"
license=('unknown')
depends=('mono' 'gtk-sharp-3' 'gtk-layer-shell')
makedepends=('git' 'mono' 'gtk-sharp-3')

# to update version
# makepkg --printsrcinfo > .SRCINFO

prepare() {
	git clone "$url.git" --recurse-submodules
}

build() {
	cd "wifi-menu"
	mcs '-recurse:*.cs' -pkg:gtk-sharp-3.0 -out:wifi-menu
}

package()
{
	sudo install -m 755 -o root -g root wifi-menu/wifi-menu /usr/bin/wifi-menu
}