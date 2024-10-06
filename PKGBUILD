# Maintainer: Nathaniel van Diepen <eeems@eeems.email>
# Contributor: scybernaut <scybernaut at scybernaut dot me>
# Contributor: Guoyi Zhang <GuoyiZhang at malacology dot net>

pkgname=gnome-shell-extension-tray-icons-reloaded
pkgver=31
pkgrel=1
pkgdesc="GNOME Shell extension which bring back Tray Icons to top panel, with additional features."
arch=('any')
url="https://github.com/MartinPL/Tray-Icons-Reloaded"
license=('GPL3')
depends=('gnome-shell')
_commit="af92191413237145e8e13e562d48175168b4f3df"
_name="tray-icons-reloaded"
source=("https://github.com/MartinPL/$_name/archive/$_commit.zip")
sha256sums=('27393263a504a0e505beb6a785ac89950c0ad2f590d8bbef3e3e2b7bafa9f380')

build() {
	cd "${srcdir}/${_name}-${_commit}"
	pwd
	make
}

package() {
	cd "${srcdir}/${_name}-${_commit}"
	local _uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
	local _destdir="$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"

	install -Dm644 -t "${_destdir}" metadata.json *.js *.css
	cp -r --no-preserve=ownership,mode preferences "${_destdir}"
	install -Dm644 -t "${pkgdir}/usr/share/glib-2.0/schemas/" schemas/*.xml
}
