# Maintainer: Christopher Loen <christopherloen at gmail dot com>
pkgname='anonsurf'
pkgver='2.0'
pkgrel=1
pkgdesc='A script from ParrotSec that provides a strong system-wide anonymization module'
arch=('any')
url='https://www.parrotsec.org'
license=('GPL')
depends=('tor' 'iptables' 'resolvconf' 'dnsmasq')
source=('https://github.com/ParrotSec/anonsurf/blob/master/anonsurf_2.0+parrot4_all.deb?raw=true'
        'https://raw.githubusercontent.com/ParrotSec/anonsurf/master/anonsurf/torrc')
md5sums=('412d3524f15feb7b995ad4ab62cb745f'
         '60129a23feb63567b11ad21179303d6b')
prepare(){
           cd "${srcdir}"
           tar xf "data.tar.xz"
           sed -i 's/debian-tor/tor/g' usr/bin/anonsurf
           sed -i 's/service tor stop/systemctl stop tor/g' usr/bin/anonsurf
           sed -i 's/service dnsmasq stop/systemctl stop dnsmasq/g' usr/bin/anonsurf
           sed -i 's/service resolvconf start/systemctl start resolvconf/g' usr/bin/anonsurf
           sed -i 's/service resolvconf restart/systemctl restart resolvconf/g' usr/bin/anonsurf
           sed -i 's/service dnsmasq start/systemctl start dnsmasq/g' usr/bin/anonsurf
           sed -i 's/service tor status/systemctl status tor/g' usr/bin/anonsurf
}
package() {
           cd "${srcdir}"
           install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
           install -dm755 "${pkgdir}/usr/bin/"
           install -dm755 "${pkgdir}/etc/${pkgname}"
           cp -rf usr/bin/anonsurf "${pkgdir}/usr/bin/anonsurf"
           cp torrc "${pkgdir}/etc/${pkgname}/torrc"
           cp "usr/share/doc/anonsurf/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
