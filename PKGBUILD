# Maintainer Lizr <oilizr2004@gmail.com>
pkgname=cnijfilter-e560series
pkgver=4.10
pkgrel=1
pkgdesc="Canon IJ Printer Driver (for E560 series)"
arch=('i686' 'x86_64')
url="http://support-cn.canon-asia.com/contents/CN/ZH/0100588503.html"
license=('custom')
depends=('popt' 'libcups' 'libxml2')
source=('http://gdlp01.c-wss.com/gds/5/0100005885/01/cnijfilter-e560series-4.10-1-deb.tar.gz')
md5sums=('38ac1c4eb70e5fce53bd06fd571c3830')

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
    ar -x "$srcdir/${pkgname}-${pkgver}-1-deb/packages/cnijfilter-e560series_${pkgver}-1_${debarch}.deb" data.tar.gz
    tar -xf data.tar.gz && rm data.tar.gz

    # Weird permissions error from namcap
    chmod 664 usr/lib/bjlib/cnnet.ini
    chown root:root usr/lib/bjlib/cnnet.ini

    # Move licenses to their proper locations
    install -d usr/share/licenses/cnijfilter-e400series
    mv usr/share/doc/cnijfilter-common/LICENSE-cnijfilter-${pkgver}*.txt usr/share/licenses/cnijfilter-e400series/
    rm -r usr/share/doc/

    # Move the udev rule to its proper location
    mv etc/udev usr/lib/
    rmdir etc/
}
