# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>

_themename=simpliX
_pkgname=simplix
pkgbase="${_pkgname}-theme"
pkgname=("openbox-theme-${_pkgname}-git" "xfce-theme-${_pkgname}-git" "${_pkgname}-theme-common-git")
pkgver=r6.e860f1e
pkgrel=2
arch=('any')
url='http://sixsixfive.deviantart.com/art/simpliX-346404452'
license=('CCPL:cc-by-sa-4.0')

makedepends=('git' 'gtk-engine-murrine' 'gtk-engines')

source=('git+https://github.com/sixsixfive/simpliX.git')
sha512sums=('SKIP')

pkgver() {
	cd ${srcdir}/${_themename}
	(
		set -o pipefail
		git describe --long --tags 2>/dev/null | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

package_openbox-theme-simplix-git() {
	pkgdesc='A very bright, simple but daily usable theme for Openbox'
	depends=("${pkgbase}-common-git")
	optdepends=('openbox: to use this theme')
	provides=("openbox-theme-${_pkgname}-git=${pkgver}")
	conflicts=("openbox-theme-${_pkgname}")
	replaces=("openbox-theme-${_pkgname}")

	# Install theme
	cd "${srcdir}"/${_themename}
	mkdir -p "${pkgdir}"/usr/share/themes/${_themename}
	cp -R openbox-3 "${pkgdir}"/usr/share/themes/${_themename}/
}

package_xfce-theme-simplix-git() {
	pkgdesc='A very bright, simple but daily usable theme for Xfce'
	depends=("${pkgbase}-common-git" 'gtk-engines' 'gtk-engine-murrine')
	optdepends=('xfwm4: to use this theme')
	provides=("xfce-theme-${_pkgname}-git=${pkgver}")
	conflicts=("xfce-theme-${_pkgname}")
	replaces=("xfce-theme-${_pkgname}")

	# Install theme
	cd "${srcdir}"/${_themename}
	mkdir -p "${pkgdir}"/usr/share/themes/${_themename}
	cp -R {gtk-2.0,metacity-1,xfce-notify-4.0,xfwm4,index.theme} "${pkgdir}"/usr/share/themes/${_themename}/
}

package_simplix-theme-common-git() {
	pkgdesc="Common data files for ${pkgbase}"
	provides=("${pkgbase}-common-git=${pkgver}")

	# Install wallpaper (pattern)
	cd "${srcdir}"/${_themename}
	mkdir -p "${pkgdir}"/usr/share/backgrounds/${_themename}
	cp extras/Wallpapers/Patterns/wallpaper1.png "${pkgdir}"/usr/share/backgrounds/${_themename}/${_pkgname}-wallpaper.png
}
