# Maintainer: Brian Guthrie <aur at nocm dot org>
pkgname=apache-karaf
pkgver=4.2.2
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
sha512sums=('19065be601df1d3ff14b13654e3313d156905c6df4eb619e5b9c96346148b348da9500fa6e2696b22a74e3b3d342fdfa469a5392a866594d9da82f4fcc8011d9'
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
