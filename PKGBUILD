# Maintainer: Brian Guthrie <aur at nocm dot org>
pkgname=apache-karaf
pkgver=4.1.5
pkgrel=1
pkgdesc="JVM application and OSGi container"
arch=('any')
url="http://karaf.apache.org/"
license=('Apache')
depends=('bash' 'java-environment>=8')
options=('!strip')
backup=("opt/${pkgname}/etc/all.policy"
        "opt/${pkgname}/etc/custom.properties"
        "opt/${pkgname}/etc/keys.properties"
        "opt/${pkgname}/bin/setenv")

source=("https://dist.apache.org/repos/dist/release/karaf/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        'apache-karaf.service')
sha512sums=('fdc25a08f92177d22cc6799e9a4c57f1c58b3bd3be18c46663fc7f43b2d8abc96718c4377ebb5763ee67fea2ff3f281429a8881f51acf55ce0bfb7dcafcca832'
            'bb9b46c01282baf22fd0d37f47023a833c98dac74c42cf54117476af491ec7bf02856c6b74e10776d692053aa2fe0867da1b6da4bc273680666b126995ec3076')

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
