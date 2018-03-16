# Maintainer: Donald Webster <fryfrog@gmail.com>
# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>
pkgname="nzbhydra2"
pkgver=1.4.7
pkgrel=2
pkgdesc="Meta search for NZB indexers"
arch=('any')
url="https://github.com/theotherp/nzbhydra2"
license=('Apache')
depends=('python2' 'java-runtime-headless>=8')

source=("https://github.com/theotherp/nzbhydra2/releases/download/v${pkgver}/${pkgname}-${pkgver}-linux.zip"
        "https://raw.githubusercontent.com/theotherp/nzbhydra2/master/other/wrapper/nzbhydra2wrapper.py"
        'nzbhydra2.service'
        'nzbhydra2.tmpfiles'
        'nzbhydra2.sysusers')

sha256sums=('429e45dfda29435e76ee32fa4c654d30ddeebb2ed604089b6dd2d0d58c3ab309'
            '9ef57961528118292fd6775029c65ba0fde6b829a912162bcd26c7918b683289'
            '8c864fa865c92a6e0182f4dd3d4032ad85f09d021444cca217efafecbeff33c3'
            '315238b0b09fc3f63af140826ec7fb435a89761f3ed5b624e0b1fbacb4c23c97'
            '8f91eb4f98f7f5c11590b29b1394dfa7ca62ad115feeac4f402c9ac094fb925a')

package() {
    install -d -m 755 "${pkgdir}/usr/lib/nzbhydra2"
    cp -dpr --no-preserve=ownership "${srcdir}/lib" "${srcdir}/readme.md" "${pkgdir}/usr/lib/nzbhydra2"
    install -D -m 755 "${srcdir}/nzbhydra2wrapper.py" "${pkgdir}/usr/lib/nzbhydra2"
    install -D -m 755 "${srcdir}/nzbhydra2" "${pkgdir}/usr/lib/nzbhydra2"

    install -D -m 644 "${srcdir}/nzbhydra2.service" "${pkgdir}/usr/lib/systemd/system/nzbhydra2.service"
    install -D -m 644 "${srcdir}/nzbhydra2.sysusers" "${pkgdir}/usr/lib/sysusers.d/nzbhydra2.conf"
    install -D -m 644 "${srcdir}/nzbhydra2.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/nzbhydra2.conf"
}
