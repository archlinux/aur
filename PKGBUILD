# Maintainer: Nathaniel van Diepen <eeems@eeems.email>
# Contributor: scybernaut <scybernaut at scybernaut dot me>
# Contributor: Guoyi Zhang <GuoyiZhang at malacology dot net>

pkgname=gnome-shell-extension-tray-icons-reloaded
pkgver=30
pkgrel=2
pkgdesc="GNOME Shell extension which bring back Tray Icons to top panel, with additional features."
arch=('any')
url="https://github.com/MartinPL/Tray-Icons-Reloaded"
license=('GPL3')
depends=('gnome-shell')
_commit="d76277e93afbff4338060bcfec4d6cf85059c1d8"
_name="tray-icons-reloaded"
source=("https://github.com/MartinPL/$_name/archive/$_commit.zip")
sha256sums=('152177538252e496f3748eada9a481de650c602b0b899ad8911031625620854f')

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
