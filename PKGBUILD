# Maintainer: allddd <allddd (at) proton (dot) me>

pkgname=tuptime
pkgver=5.2.4
pkgrel=1
pkgdesc='Historical and statistical system uptime reporting'
arch=('any')
url='https://github.com/rfmoz/tuptime'
license=('GPL-2.0-only')
depends=('python')
source=("${url}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles")
sha256sums=('d4038c5efb561ce4672f1b60025c6099fa243bed10063921ff9d1390cf5de863'
            '5a8c0a9c26df2f2a2356021784b03674b764d608ec4220138e4c5032bb74a3bb'
            '1364cd0e16b017b6d2cc19a873b63ee1ac07f56fbc4641b5ed9f07b5bf37be82')
install=${pkgname}.install

package() {
    install -Dm644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 src/tuptime -t "${pkgdir}/usr/bin/"
    install -Dm644 src/systemd/tuptime.service -t "${pkgdir}/usr/lib/systemd/system/"
    install -Dm644 src/systemd/tuptime-sync.timer -t "${pkgdir}/usr/lib/systemd/system/"
    install -Dm644 src/systemd/tuptime-sync.service -t "${pkgdir}/usr/lib/systemd/system/"
    install -Dm644 src/man/tuptime.1 -t "${pkgdir}/usr/share/man/man1/"
    install -Dm644 tuptime-manual.txt -t "${pkgdir}/usr/share/doc/${pkgname}/"
}

# vim: ts=4 sw=4 et:
