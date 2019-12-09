# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
pkgname=skyminer
pkgname1=skyminer
pkgdesc="skyminer bootstrapping package *INSTALL IN CHROOT ONLY*"
pkgver=0.0.2
pkgrel=1
arch=('any')
license=()
makedepends=()
source=(skyminer.tar.gz)
sha256sums=('2070fefb48775a672069dc3f811896b3d64f6776f0aaef26d768d003f271f19a')

package() {
	mkdir -p ${pkgdir}/etc/systemd/system
	mkdir -p ${pkgdir}/usr/lib/systemd/system
	mkdir -p ${pkgdir}/usr/lib/skycoin/skybootstrap
	mkdir -p ${pkgdir}/usr/bin
	rmextension=".sh"
	skyminerscripts=$(ls *.sh)
	skyminerservices=$(ls *.service)
for i in $skyminerscripts ; do
	install -Dm755 ${i} ${pkgdir}/usr/lib/skycoin/${pkgname1}/${i}
	ln -rTsf ${pkgdir}/usr/lib/skycoin/${pkgname1}/${i} ${pkgdir}/usr/bin/${i//$rmextension}
	chmod +x ${pkgdir}/usr/lib/skycoin/${pkgname1}/${i}
done
for i in $skyminerservices ; do
	install -Dm644 ${i} ${pkgdir}/usr/lib/systemd/system/${i}
	done
	install -Dm755 readonlycache.go ${pkgdir}/usr/lib/skycoin/${pkgname1}/readonlycache.go
}
