# Maintainer: Egor Vorontsov <sdoregor@sdore.me>
# Contributor: Martijn Braam <martijn@brixit.nl>

_pkgbase=postprocessd
pkgname=${_pkgbase}-git
pkgver=0.2.1.r0.g80a9389
pkgrel=2
pkgdesc="Queueing megapixels post-processor (git version)"
arch=('any')
url="https://git.sr.ht/~martijnbraam/postprocessd"
license=('GPL3')
depends=('libraw' 'libtiff' 'libjpeg-turbo' 'libexif' 'opencv')
makedepends=('meson' 'scdoc')
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgbase}"

	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_pkgbase}"

	arch-meson . build
	meson compile -C build
}

package() {
	cd "${srcdir}/${_pkgbase}"

	meson install -C build --destdir "${pkgdir}"
}
