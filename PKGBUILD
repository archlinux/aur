# Maintainer: Nathaniel van Diepen <eeems@eeems.email>
# Contributor: scybernaut <scybernaut at scybernaut dot me>
# Contributor: Guoyi Zhang <GuoyiZhang at malacology dot net>

pkgname=gnome-shell-extension-tray-icons-reloaded
pkgver=26
pkgrel=1
pkgdesc="GNOME Shell extension which bring back Tray Icons to top panel, with additional features."
arch=('any')
url="https://github.com/MartinPL/Tray-Icons-Reloaded"
license=('GPL3')
depends=('gnome-shell')
_commit="5891310a217cd80416c057d87d4a25e4787afb92"
_name="Tray-Icons-Reloaded"
source=("https://github.com/MartinPL/$_name/archive/$_commit.zip")
sha256sums=('3e30453bfd223d8d666569ddeae3ca9527c2380bf12f71defeb4d7362cba6697')

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
