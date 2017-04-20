# Maintainer: Sven Karsten Greiner <sven@sammyshp.de>
# Contributor: Jakub Schmidtke <sjakub-at-gmail.com>

pkgname=oki-400-pcl
pkgver=5
pkgrel=2
pkgdesc="CUPS drivers for OKI B4000, B400 and MB400 PCL printers"
arch=('any')
url="http://www.okidata.com/mkt/html/nf/Drivers.html"
license=('GPL')
depends=('cups' 'ghostscript' 'coreutils')
source=("https://www.sammyshp.de/misc/OKI400/MB400PCLv${pkgver}.tar.gz")
sha1sums=('77673f953e89393d8fa3069441cd1a21f3a73b09')

build() {
    cd ${srcdir}/MB400PCL
    rm -f OK400PCL.ppd
    gunzip OK400PCL.ppd.gz || return 1

    sed -i 's|/usr/bin/cut|/bin/cut|' rastertookimonochrome
    sed -i 's|/usr/bin/tr|/bin/tr|' rastertookimonochrome
}

package() {
    cd ${srcdir}/MB400PCL

    mkdir -p ${pkgdir}/usr/lib/cups/filter
    mkdir -p ${pkgdir}/usr/share/cups/model

    install -m 755 rastertookimonochrome ${pkgdir}/usr/lib/cups/filter/rastertookimonochrome || return 1
    install -m 644 OK400PCL.ppd ${pkgdir}/usr/share/cups/model/ok400pcl.ppd || return 1
}
