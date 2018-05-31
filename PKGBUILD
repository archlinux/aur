# Maintainer: Christian Mauderer <oss@c-mauderer.de>
pkgname=ucm_plbossart-git
pkgrel=1
pkgver=r60.9dc688f
pkgdesc="UCM files from plbossart."
arch=('any')
url="https://github.com/plbossart/UCM"
license=('custom')
depends=('alsa-lib')
makedepends=('git')
conflicts=('ucm_plbossart')
provides=('ucm_plbossart')
source=("${pkgname}"::'git+https://github.com/plbossart/UCM.git')
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/${pkgname}"

	# copy files
	mkdir -p "${pkgdir}/usr/share/alsa/ucm/"
	cp -r * "${pkgdir}/usr/share/alsa/ucm/"
	chmod u=rwX "${pkgdir}/usr/share/alsa/ucm/"
	chmod go=rX "${pkgdir}/usr/share/alsa/ucm/"

	# remove the ones conflicting with alsa-lib
	rm -r "${pkgdir}/usr/share/alsa/ucm/bytcr-rt5651"
	rm -r "${pkgdir}/usr/share/alsa/ucm/chtrt5645"
}
