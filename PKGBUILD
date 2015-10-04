# Maintainer: xor <xor@rotce.de>

pkgname=hashboot-git
pkgver=0.8.0
pkgrel=1
pkgdesc="A utility to check at boottime befor network, if /boot or mbr were manipulated."
arch=('any')
url="https://git.tastytea.de/?p=hashboot.git;a=summary"
license=('custom:"hugware"')
depends=('bash' 'coreutils' 'tar' 'which' 'grep' 'gawk' 'util-linux' 'diffutils' 'sed' )
makedepends=('git' 'sed')
conflicts=('chkboot' 'mkinitcpio-chkcryptoboot')
backup=('etc/hashboot.cfg')
install=('hashboot.install')
source=(git+git://git.tastytea.de/repositories/hashboot.git)
md5sums=('SKIP')

build() {
	cd "${srcdir}/hashboot"
	sed 's/xfer/ne/g' ${srcdir}/hashboot/hashboot > ${srcdir}/hashboot/hashboot.tmp
}

package() {
	msg "Copy files"
	cd "${srcdir}/hashboot"
	install -m755 -d "${pkgdir}/usr/lib/systemd/system/"
	install -Dm644 initscript.systemd "${pkgdir}/usr/lib/systemd/system/hashboot.service"
	install -Dm755 hashboot "${pkgdir}/usr/bin/hashboot"
        install -Dm755 hashboot.tmp "${pkgdir}/usr/bin/hashboot"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/HUGWARE"
}
