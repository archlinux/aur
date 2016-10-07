
# Maintainer: Stephane Cachemaille <scachemaille@gmail.com>
#
# Based on:
# cnijfilter-mx530series by Michal Lisowski <lisu87@gmail.com>
#

pkgname=cnijfilter-mx470series
pkgver=4.10
pkgrel=1
pkgdesc="Canon IJ Printer Driver (for MX470 series)"
arch=('i686' 'x86_64')
url="http://www.canon.co.uk/support/consumer_products/products/fax__multifunctionals/inkjet/pixma_mx_series/pixma_mx475.aspx?type=drivers&language=EN&os=Linux%20(64-bit)"
license=('custom')
depends=('popt' 'libcups' 'libxml2')
source=('http://gdlp01.c-wss.com/gds/9/0100005869/01/cnijfilter-mx470series-4.10-1-deb.tar.gz')
sha256sums=('d173883f280d568a701ab0d278f95f0fba266ed9d44969f534147144b4804506')

package() {
    if [ "${CARCH}" = 'x86_64' ]; then
      debarch="amd64"
    elif [ "${CARCH}" = 'i686' ]; then
      debarch="i386"
    fi
    cd "$pkgdir"

# Common files
ar -x "$srcdir/${pkgname}-${pkgver}-1-deb/packages/cnijfilter-common_${pkgver}-1_${debarch}.deb" data.tar.gz
tar -xf data.tar.gz && rm data.tar.gz

# Model specific files
ar -x "$srcdir/${pkgname}-${pkgver}-1-deb/packages/cnijfilter-mx470series_${pkgver}-1_${debarch}.deb" data.tar.gz
tar -xf data.tar.gz && rm data.tar.gz

# Weird permissions error from namcap
chmod 664 usr/lib/bjlib/cnnet.ini
chown root:root usr/lib/bjlib/cnnet.ini

# Move licenses to their proper locations
install -d usr/share/licenses/cnijfilter-mx470series
mv usr/share/doc/cnijfilter-common/LICENSE-cnijfilter-${pkgver}*.txt usr/share/licenses/cnijfilter-mx470series/
rm -r usr/share/doc/

# Move the udev rule to its proper location
mv etc/udev usr/lib/
rmdir etc/
}
