# Maintainer: Donald Webster <fryfrog@gmail.com>
# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>
pkgname="nzbhydra2"
pkgver=1.0.3
pkgrel=1
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

sha256sums=('b878c612cf406ad4339012348190902ab52b389e2e995ae14589cb209997c9af'
            '49b9e3ef6c46e3b43fabda35b7c8a09d389d3cd3505f292f9a1f0a21a28ca289'
            '8f9ec4cb221ef53a1ab0a3126d630cf104d00ea3a94204e1dca9f0748998aced'
            '8f91eb4f98f7f5c11590b29b1394dfa7ca62ad115feeac4f402c9ac094fb925a')

package() {
    install -d -m 755 "${pkgdir}/usr/lib/nzbhydra2"

    cd "${srcdir}"
    cp -dpr --no-preserve=ownership downloaderScripts lib nzbhydra2 readme.md "${pkgdir}/usr/lib/nzbhydra2"

    install -d -m 755 "${pkgdir}/var/lib/nzbhydra2"

    install -D -m 644 "${srcdir}/nzbhydra2.service" "${pkgdir}/usr/lib/systemd/system/nzbhydra2.service"
    install -D -m 644 "${srcdir}/nzbhydra2.sysusers" "${pkgdir}/usr/lib/sysusers.d/nzbhydra2.conf"
}
