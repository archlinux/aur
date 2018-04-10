# Maintainer: Yiannis A Ginis <drxspace[at]gmail[dot]com>

_pkgname=macOS-Sierra
pkgname=gtk-theme-macos-sierra-archers-git
pkgver=3.2.r3.g3b717be
pkgrel=1
pkgdesc='macOS and OS X 10.11 GTK theme for Gnome Shell and GTK-based desktops.'
arch=('any')
url="https://github.com/B00merang-Project/${_pkgname}"
license=('GPL3')
provides=("${_pkgname}=${pkgver}")
depends=('gtk3>=3.6'
	'gnome-themes-standard'
	'gdk-pixbuf2'
	'gtk-engines'
	'gtk-engine-murrine')
makedepends=('git')
optdepends=('gnome-shell>=3.10: The GNOME Shell'
	'gnome-tweak-tool: A graphical tool to tweak gnome settings')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's/-/.r/;s/-/./g'
}

package() {
	install -dm755 ${pkgdir}/usr/share/themes/${_pkgname}
	cp --no-preserve=mode "${srcdir}/${_pkgname}"/index.theme ${pkgdir}/usr/share/themes/${_pkgname}
	cp --no-preserve=mode -r "${srcdir}/${_pkgname}"/gnome-shell/ ${pkgdir}/usr/share/themes/${_pkgname}
	cp --no-preserve=mode -r "${srcdir}/${_pkgname}"/gtk-2.0/ ${pkgdir}/usr/share/themes/${_pkgname}
	cp --no-preserve=mode -r "${srcdir}/${_pkgname}"/gtk-3.0/ ${pkgdir}/usr/share/themes/${_pkgname}
	cp --no-preserve=mode -r "${srcdir}/${_pkgname}"/gtk-3.20/ ${pkgdir}/usr/share/themes/${_pkgname}
	cp --no-preserve=mode -r "${srcdir}/${_pkgname}"/metacity-1/ ${pkgdir}/usr/share/themes/${_pkgname}
	cp --no-preserve=mode -r "${srcdir}/${_pkgname}"/xfwm4/ ${pkgdir}/usr/share/themes/${_pkgname}

	find ${pkgdir}/usr/ -type f -exec chmod 644 {} \;
	find ${pkgdir}/usr/ -type d -exec chmod 755 {} \;
} 
