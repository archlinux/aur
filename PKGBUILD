# Contributor: Sapphira Armageddos <shadowkyogre@aim.com>
pkgname=compiz-alone-utils-git
pkgver=20110403
pkgrel=1
pkgdesc="A few Compiz Standalone utilities based off of some scripts that come with Openbox."
arch=('any')
url="https://github.com/ShadowKyogre/Compiz-Standalone-Utils"
license=('GPL')
depends=()
conflicts=('compiz-alone-utils')
optdepends=('pyxdg: for the xdg-autostart script')
makedepends=('git')
install=${pkgname%-git}.install

_giturl=git://github.com/ShadowKyogre/Compiz-Standalone-Utils.git
_gitname="CompizSAUtils"

# trick re-determining the build revision and, or entertain the hidden
# makepkg option --forcever, huh
if [ -z "${FORCE_VER}" ]; then
    msg "Determining latest build revision..."
    FORCE_VER=$(date +%Y%m%d)
fi



build() {
	cd "$srcdir"
	if [ -d $_gitname ];then
		cd $_gitname && git pull origin
	else
		git clone $_giturl $_gitname
	fi
}

package() {
	cd ${srcdir}/$_gitname

	mkdir -p ${pkgdir}/usr/bin
	mkdir -p ${pkgdir}/{usr/share/xs,etc/X11/s}essions
	mkdir -p ${pkgdir}/etc/xdg/compiz

	install -Dm755 autostart.sh ${pkgdir}/etc/xdg/compiz/autostart.sh
	install -Dm755 compiz-alone-session ${pkgdir}/usr/bin/
	install -Dm755 xdg-autostart ${pkgdir}/usr/bin/
	install -Dm644 compiz-alone.desktop ${pkgdir}/etc/X11/sessions/
	install -Dm644 compiz-alone.desktop ${pkgdir}/usr/share/xsessions/
}

# vim:set ts=2 sw=2 et:

