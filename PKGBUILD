# Maintainer: Donald Webster <fryfrog@gmail.com>
# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>
pkgname="nzbhydra2"
pkgver=1.0.4
pkgrel=3
pkgdesc="Meta search for NZB indexers"
arch=('any')
url="https://github.com/theotherp/nzbhydra2"
license=('Apache')
depends=('java-runtime-headless>=8')
conflicts=('nzbhydra2-git')
install='nzbhydra2.install'
#https://github.com/theotherp/nzbhydra2/releases/download/v1.0.3/nzbhydra2-1.0.3-linux.zip
source=("https://github.com/theotherp/nzbhydra2/releases/download/v${pkgver}/${pkgname}-${pkgver}-linux.zip"
        'nzbhydra2.service'
        'nzbhydra2.install'
        'nzbhydra2.sysusers')

sha256sums=('2cf0efba1fb6dc720ae9537ccef806d7fbfed94dac995152d0562de37ce91ab3'
            'ef4dc48daf7c061f0344faaba9450e72b95dfad4b0df669a04194a462149cdc1'
            '355dafa76d39c42f0a449080b2fe3673536e409da3f3b6c89f03c09dd303438c'
            '8f91eb4f98f7f5c11590b29b1394dfa7ca62ad115feeac4f402c9ac094fb925a')

package() {
    install -d -m 755 "${pkgdir}/usr/lib/nzbhydra2"

    cd "${srcdir}"
    chmod +x nzbhydra2 downloaderScripts/*.py 
    cp -dpr --no-preserve=ownership downloaderScripts nzbhydra2 readme.md "${pkgdir}/usr/lib/nzbhydra2"

    install -d -m 755 "${pkgdir}/var/lib/nzbhydra2"
    cp -dpr --no-preserve=ownership lib "${pkgdir}/usr/lib/nzbhydra2"

    install -D -m 644 "${srcdir}/nzbhydra2.service" "${pkgdir}/usr/lib/systemd/system/nzbhydra2.service"
    install -D -m 644 "${srcdir}/nzbhydra2.sysusers" "${pkgdir}/usr/lib/sysusers.d/nzbhydra2.conf"
}
