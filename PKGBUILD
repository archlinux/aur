# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>

_themename=simpliX
pkgname=openbox-theme-simplix
pkgver=r3.888f015
pkgrel=2
pkgdesc="A very bright, simple but daily usable theme for Openbox."
arch=(
	"any"
)
url="http://sixsixfive.deviantart.com/art/simpliX-346404452"
license=(
	"CCPL:cc-by-sa-4.0"
)

depends=(
	"openbox"
)
optdepends=(
	"slim-theme-simplix: SLiM theme"
	"kdm-theme-simplix: KDM theme"
)
makedepends=(
	"git"
)
provides=(
	"${pkgname}=${pkgver}"
)
conflicts=()
replaces=()

source=(
	"git+https://github.com/sixsixfive/${_themename}.git"
)
sha384sums=(
	"SKIP"
)
sha512sums=(
	"SKIP"
)

pkgver() {
	cd ${srcdir}/${_themename}
	(
		set -o pipefail
		git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

package() {
	# Change the current working directory
	cd ${srcdir}/${_themename}
	
	# Openbox theme
	mkdir -p ${pkgdir}/usr/share/themes/${_themename}
	cp -R ./openbox-3 ${pkgdir}/usr/share/themes/${_themename}
	
	# Wallpaper (pattern)
	mkdir -p ${pkgdir}/usr/share/backgrounds/${_themename}
	cp -u ./extras/Wallpapers/Patterns/wallpaper1.png ${pkgdir}/usr/share/backgrounds/${_themename}/${_themename}.png
	
	# License
	mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
	cp ./COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}