# Maintainer: Henrique Abreu <hgabreu AT gmail.com>

pkgname=meeting-trigger
pkgver=0.0.1
pkgrel=1
pkgdesc="Monitor apps using the Mic (on pulseaudio) to trigger automations"
arch=('any')
url="https://github.com/hgabreu/meeting-trigger"
license=('GPL3')
depends=('bash' 'coreutils' 'findutils' 'grep' 'pulseaudio' 'sed' 'run-parts')
source=("$pkgname::$url/releases/download/v$pkgver/$pkgname-$pkgver.tgz")
md5sums=("9b924647ddc838cddfc5763ec3476c8a")

build () {
	cd "${srcdir}"
	sed -i -e "s/VERSION.*=.*/VERSION='${pkgver}'/g" "${pkgname}"
}

package() {
	cd "${srcdir}"

	mkdir -p "${pkgdir}/usr/bin"
	cp ${pkgname} "${pkgdir}/usr/bin"
	chmod u=rwx,go=rx "${pkgdir}/usr/bin/${pkgname}"

	mkdir -p "${pkgdir}/usr/lib/systemd/user"
	cp ${pkgname}.service "${pkgdir}/usr/lib/systemd/user"
	chmod u=rw,go=r "${pkgdir}/usr/lib/systemd/user//${pkgname}.service"
}
