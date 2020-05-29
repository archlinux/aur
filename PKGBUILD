# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Jan Kroulik <jk at wo dot cz>

pkgname=cups-xerox-workcentre-3025
pkgver=1.0.25
pkgrel=3
pkgdesc='Xerox WorkCentre 3025 printer driver for CUPS'
url='https://www.support.xerox.com/support/workcentre-3025/downloads/enus.html?operatingSystem=linux&fileLanguage=en'
arch=('x86_64')
license=('custom')
backup=('etc/smfp.conf')
source=('http://download.support.xerox.com/pub/drivers/WC3025/drivers/linux/en_GB/Xerox_WorkCentre_3025_Linux-Driver.tar.gz')
sha256sums=('845e56dae3a2ed37064ad88e6b51a09ec90bdcd1c227c11ef4c2d121da3ddcc2')

build() {
    cd 'uld'
    find -type f -name '*.ppd' -execdir gzip -f {} \;
}

package() {
    cd 'uld'
    install -Dm755 -t "$pkgdir/usr/lib/cups/filter/" x86_64/rastertospl
    install -Dm644 -t "$pkgdir/etc/" noarch/etc/smfp.conf
    cd 'noarch/share/ppd'
    install -Dm644 -t "$pkgdir/usr/share/ppd/xerox/" Xerox_WorkCentre_3025*.ppd.gz
    install -Dm644 -t "$pkgdir/usr/share/ppd/xerox/cms/" cms/WC3225sc.cts
}
