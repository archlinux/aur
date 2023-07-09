# Maintainer: Nathaniel van Diepen <eeems@eeems.email>
# Contributor: scybernaut <scybernaut at scybernaut dot me>
# Contributor: Guoyi Zhang <GuoyiZhang at malacology dot net>

pkgname=gnome-shell-extension-tray-icons-reloaded
pkgver=27
pkgrel=1
pkgdesc="GNOME Shell extension which bring back Tray Icons to top panel, with additional features."
arch=('any')
url="https://github.com/MartinPL/Tray-Icons-Reloaded"
license=('GPL3')
depends=('gnome-shell')
_commit="4453cc45591d9ce9705afdbd73f71b8f75ad218b"
_name="Tray-Icons-Reloaded"
source=("https://github.com/MartinPL/$_name/archive/$_commit.zip")
sha256sums=('0d0b1c0b03ca765992d5f1731a341f7d96739326b3687719403149ef30aff5fc')

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
