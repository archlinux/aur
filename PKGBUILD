# Maintainer: Brian Guthrie <aur at nocm dot org>
pkgname=apache-karaf
pkgver=4.0.7
pkgrel=1
pkgdesc="JVM application and OSGi container"
arch=('any')
url="http://karaf.apache.org/"
license=('Apache')
depends=('bash' 'java-environment>=7')
options=('!strip')
backup=("opt/${pkgname}/etc/all.policy"
        "opt/${pkgname}/etc/custom.properties"
        "opt/${pkgname}/etc/keys.properties"
        "opt/${pkgname}/bin/setenv")

source=("http://www-eu.apache.org/dist/karaf/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        'apache-karaf.service')
sha512sums=('9a09bd05c96ac2d0c1094d4197fd07bda352195950de91cfcc897aa5a20bc7ad60959706bfc9581aaba45ca9018b4666839f8145b4ea06904fcfa35a089afc42'
            '23f8ad3f433b0a7223aafdf88167d873f2292fdde526c3e4571609dc5e529503ccaac74ed80eb028a94d0e00a9998791ed2f6a68d8c232664ce83e59d5fa96ec')

prepare() {
    cd "${pkgname}-${pkgver}"
    rm bin/*.bat
}

package() {
    install -d "${pkgdir}/opt"
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/lib/systemd/system"

    install -m644 apache-karaf.service "${pkgdir}/usr/lib/systemd/system/"

    cd "${pkgname}-${pkgver}"
    cp -r "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/opt/${pkgname}"
    ln -s "/opt/${pkgname}/bin/karaf" "${pkgdir}/usr/bin/karaf-server"
    ln -s "/opt/${pkgname}/bin/client" "${pkgdir}/usr/bin/karaf-client"
}
