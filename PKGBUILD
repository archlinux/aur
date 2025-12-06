# Maintainer: Niccolò Belli <niccolo.belli@linuxsystems.it>
# Contributor: XZS <d dot f dot fischer at web dot de>
# Contributor: Nathaniel van Diepen <eeems@eeems.email>
# Contributor: scybernaut <scybernaut at scybernaut dot me>
# Contributor: Guoyi Zhang <GuoyiZhang at malacology dot net>

pkgname=gnome-shell-extension-tray-icons-reloaded
pkgver=33
pkgrel=2
pkgdesc="GNOME Shell extension which bring back Tray Icons to top panel, with additional features."
arch=('any')
url="https://github.com/MartinPL/Tray-Icons-Reloaded"
license=('GPL3')
depends=('gnome-shell')
_name="tray-icons-reloaded"
source=("https://github.com/MartinPL/$_name/archive/refs/tags/$pkgver.zip")
sha256sums=('a8203fe104eafa11e8b57d76c372dd72370c7ac632081a385028646dbb124f3e')
install=unsupported.install

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
