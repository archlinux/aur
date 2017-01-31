# Contributor: Ben Alex <ben.alex@acegi.com.au>
# Maintainer: Ben Alex <ben.alex@acegi.com.au>

pkgname=elephantdrive
pkgver=3.0.24
pkgrel=1
pkgdesc='Service for the Elephant Drive encrypted cloud backup service'
arch=('x86_64' 'i686')
url="http://www.elephantdrive.com"
license=('custom')
backup=('etc/elephantdrive.config')

source=('elephantdrive.service'
        "http://distribution.vaultservices.net/edNative/master${pkgver}/linux/Linux_Elephantdrive_${arch}_${pkgver}.tar.gz")
md5sums=('09a3214b733fe5313b4424926fb3ffa8'
         '6a2c5aed044b48b644a83d3282c5da67')

package() {
	mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
	install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
	mkdir ${srcdir}/extract
	${srcdir}/elephantdrive.bin --nox11 --target ${srcdir}/extract --noexec
        mkdir -p ${pkgdir}/usr/lib/elephantdrive/
	install  -m644 ${srcdir}/extract/var/lib/elephantdrive/* ${pkgdir}/usr/lib/elephantdrive/
	install -Dm755 ${srcdir}/extract/elephantdrive ${pkgdir}/usr/bin/elephantdrive
	install -Dm600 ${srcdir}/extract/elephantdrive.config ${pkgdir}/etc/elephantdrive.config
	install -Dm644 ${srcdir}/elephantdrive.service ${pkgdir}/usr/lib/systemd/system/elephantdrive.service
}
