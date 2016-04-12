# Contributor: Sapphira Armageddos <shadowkyogre@aim.com>
pkgname=compiz-alone-utils-git
pkgver=r3.8ac2684
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

_gitname="CompizSAUtils"
source=(
  "${_gitname}::git://github.com/ShadowKyogre/Compiz-Standalone-Utils.git"
)


# trick re-determining the build revision and, or entertain the hidden
# makepkg option --forcever, huh

pkgver() {
	cd "${srcdir}/${_gitname}"

  # currently don't have any tags atm
	#git describe --long --tags|sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/${_gitname}"

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

sha256sums=(
  'SKIP'
)
