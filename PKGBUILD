# Maintainer: Noel Kuntze <noel at familie dash kuntze dot de>
# Contributor: Lucas Salies Brum <lucas@archlinux.com.br>

pkgname=verynice
pkgver=1.1
pkgrel=15
pkgdesc="A tool for dynamically adjusting the nice level of processes under UNIX-like operating systems."
url="http://thermal.cnde.iastate.edu/~sdh4/verynice/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('bash')
backup=("etc/${pkgname}.conf")

source=("https://fossies.org/linux/misc/old/${pkgname}-$pkgver.tar.gz"
	    "${pkgname}.service")

sha256sums=('5830fd4ac14ba3677e49159adbb7cd61e3d42d1f0b9aa73e4ed0aa154af6cd8d'
            '26ebaae3a1f7d05d69e638b53c9555f2a7212ccf8b00f66db8add374808a5b65')

build() {
	cd "${srcdir}/${pkgname}/"
	
	make
}

package() {
	cd "${srcdir}"
	
	install -D -m755 "${pkgname}/${pkgname}"		"${pkgdir}/usr/bin/${pkgname}"
	install -D -m644 "${pkgname}/${pkgname}.conf"	"${pkgdir}/etc/${pkgname}.conf"
	install -D -m644 "${pkgname}.service"			"${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
