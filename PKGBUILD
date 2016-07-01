# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>

_themename=simpliX
pkgname=openbox-theme-simplix
pkgver=r3.888f015
pkgrel=4
pkgdesc='A very bright, simple but daily usable theme for Openbox.'
arch=('any')
url='http://sixsixfive.deviantart.com/art/simpliX-346404452'
license=('CCPL:cc-by-sa-4.0')

depends=('openbox')
makedepends=('git')
provides=("${pkgname}=${pkgver}")

source=(
	"git+https://github.com/sixsixfive/${_themename}.git"
)
sha512sums=(
	'SKIP'
)

pkgver() {
	cd "${srcdir}"/${_themename}
	(
		set -o pipefail
		git describe --long --tags 2>/dev/null | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

package() {
	# Change the current working directory
	cd "${srcdir}"/${_themename}
	
	# Openbox theme
	mkdir -p "${pkgdir}"/usr/share/themes/${_themename}
	cp -R openbox-3 "${pkgdir}"/usr/share/themes/${_themename}
	
	# Wallpaper (pattern)
	mkdir -p "${pkgdir}"/usr/share/backgrounds/${_themename}
	cp -u extras/Wallpapers/Patterns/wallpaper1.png "${pkgdir}"/usr/share/backgrounds/${_themename}/${_themename}-wallpaper.png
}
