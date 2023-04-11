# Maintainer: Stephanie Wilde-Hobbs (RX14) <git@stephanie.is>

pkgname=ampr-ripd
pkgver=2.4.1
pkgrel=3
pkgdesc="AMPR 44net RIPv2 Listener and Route Injector"
arch=("x86_64")
url="http://www.yo2loj.ro/hamprojects/"
license=("GPL2")
source=("http://www.yo2loj.ro/hamprojects/ampr-ripd-${pkgver}.tgz"
        ampr-ripd.service
        ampr-ripd.conf)
sha256sums=('b77edc7dd578da3db25c46174423832674990215aeac6f4a4f1995afe6a2c328'
            '6dfdb1fd872d6e4536f4c7c28144eb6701bfd522860671d7b100b41be2dcf00c'
            'c28bd739511fe14e97d2f945a9eb869faf47586a7552ff0daf79e5f04dcba2de')

build() {
    cd "${pkgname}-${pkgver}"

    make COPT="$CFLAGS" LOPT="$LDFLAGS"
}

package() {
    cd "${pkgname}-${pkgver}"

    install -D -m 755 ampr-ripd "${pkgdir}/usr/bin/ampr-ripd"
    install -D -m 644 ampr-ripd.1 "${pkgdir}/usr/share/man/man8/ampr-ripd.8"
    install -D -m 644 "${srcdir}/ampr-ripd.service" "${pkgdir}/usr/lib/systemd/system/ampr-ripd.service"
    install -D -m 644 "${srcdir}/ampr-ripd.conf" "${pkgdir}/etc/ampr-ripd.conf"
}
