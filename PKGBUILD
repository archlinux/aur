# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Jan Kroulik <jk at wo dot cz>

pkgname=cups-xerox-workcentre-3025
pkgver=1.0_25
pkgrel=2
pkgdesc='Xerox WorkCentre 3025 printer driver for CUPS'
url='https://www.support.xerox.com/support/workcentre-3025'
arch=('x86_64')
license=('custom')
source=('http://download.support.xerox.com/pub/drivers/WC3025/drivers/linux/en_GB/Xerox_WorkCentre_3025_Linux-Driver.tar.gz')
makedepends=('binutils' 'tar')
sha256sums=('845e56dae3a2ed37064ad88e6b51a09ec90bdcd1c227c11ef4c2d121da3ddcc2')

build() {
    cd "uld"
    find -type f -name '*ppd' -execdir gzip -f {} \;
}

package() {
    cd "uld"
    find ./noarch/etc/ -type f -execdir install -Dm644 {} "$pkgdir/etc/{}" \; -print
    find ./noarch -type f -name '*3025*.ppd.gz' -execdir install -Dm644 {} "$pkgdir/usr/share/ppd/xerox/{}" \; -print
    find ./noarch -type f -name '*3025*.cts' -execdir install -Dm644 {} "$pkgdir/usr/share/ppd/cms/{}" \; -print
    # find ./x86_64 -type f -execdir install -Dm755 {} "${pkgdir}/usr/lib/cups/filter/{}" \; -print
    install -Dm0755 ./x86_64/rastertospl "$pkgdir/usr/lib/cups/filter/rastertospl"
}
