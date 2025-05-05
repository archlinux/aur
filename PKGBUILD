# Maintainer: Nathaniel van Diepen <eeems@eeems.email>
# Contributor: scybernaut <scybernaut at scybernaut dot me>
# Contributor: Guoyi Zhang <GuoyiZhang at malacology dot net>

pkgname=gnome-shell-extension-tray-icons-reloaded
pkgver=32
pkgrel=1
pkgdesc="GNOME Shell extension which bring back Tray Icons to top panel, with additional features."
arch=('any')
url="https://github.com/MartinPL/Tray-Icons-Reloaded"
license=('GPL3')
depends=('gnome-shell')
_name="tray-icons-reloaded"
source=("https://github.com/MartinPL/$_name/archive/refs/tags/$pkgver.zip")
sha256sums=('b7a0f0523d310da5dfc613c4784f312822093f9737bd287db92c83724e04d743')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	pwd
	make
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	local _uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
	local _destdir="$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"

	install -Dm644 -t "${_destdir}" metadata.json *.js *.css
	cp -r --no-preserve=ownership,mode preferences "${_destdir}"
	install -Dm644 -t "${pkgdir}/usr/share/glib-2.0/schemas/" schemas/*.xml
}
