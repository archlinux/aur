# Maintainer: Donald Webster <fryfrog@gmail.com>
# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>
pkgname="nzbhydra2"
pkgver=1.2.0
pkgrel=1
pkgdesc="Meta search for NZB indexers"
arch=('any')
url="https://github.com/theotherp/nzbhydra2"
license=('Apache')
depends=('python2' 'java-runtime-headless>=8')
install='nzbhydra2.install'
source=("https://github.com/theotherp/nzbhydra2/releases/download/v${pkgver}/${pkgname}-${pkgver}-linux.zip"
        "https://raw.githubusercontent.com/theotherp/nzbhydra2/master/other/wrapper/nzbhydra2wrapper.py"
        'nzbhydra2.service'
        'nzbhydra2.install'
        'nzbhydra2.sysusers')

sha256sums=('77ec913150e9fe9321dadadd2543627fd9d28ef2ced619b1ea1286e127f3f13a'
            '07fe26612eed64a1c64704e963d834fdd52435fd37470325f196cab6f464c3a9'
            '8c864fa865c92a6e0182f4dd3d4032ad85f09d021444cca217efafecbeff33c3'
            '355dafa76d39c42f0a449080b2fe3673536e409da3f3b6c89f03c09dd303438c'
            '8f91eb4f98f7f5c11590b29b1394dfa7ca62ad115feeac4f402c9ac094fb925a')

package() {
    install -d -m 755 "${pkgdir}/usr/lib/nzbhydra2"

    cd "${srcdir}"
    chmod +x nzbhydra2
    cp -dpr --no-preserve=ownership lib nzbhydra2 readme.md "${pkgdir}/usr/lib/nzbhydra2"

    install -D -m 644 "${srcdir}/nzbhydra2wrapper.py" "${pkgdir}/usr/lib/nzbhydra2"

    install -d -m 755 "${pkgdir}/var/lib/nzbhydra2"

    install -D -m 644 "${srcdir}/nzbhydra2.service" "${pkgdir}/usr/lib/systemd/system/nzbhydra2.service"
    install -D -m 644 "${srcdir}/nzbhydra2.sysusers" "${pkgdir}/usr/lib/sysusers.d/nzbhydra2.conf"
}
