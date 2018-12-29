# Maintainer: Ricardo (XenGi) Band <email@ricardo.band>
pkgname=sensu-go-agent
_pkgname=sensu-agent
pkgver=5.1.0
_pkgver=5.1.0-0ubuntu18.1
pkgrel=1
pkgdesc="Sensu Go Agent"
arch=('x86_64')
url='https://sensu.io'
license=('MIT')
source=("${pkgname}-${_pkgver}_amd64.deb::https://packagecloud.io/sensu/stable/packages/ubuntu/cosmic/${pkgname}_${_pkgver}_amd64.deb/download.deb"
        "sensu.sysusers"
        "sensu.tmpfiles")
sha1sums=('321a7eb50c67a45675e688a94740db5148efd656'
          '054c2cfb7b2c4e6900fe79620b40fd060dbc0d8a'
          '9cca06fcbb23d5618382cc14e4ab4cc73c1f91fa')

prepare() {
    cd "${srcdir}"
    tar xaf data.tar.gz
    # change /usr/sbin to /usr/bin
    sed -i 's/\/usr\/sbin\//\/usr\/bin\//g' "${srcdir}/usr/share/${pkgname}-${pkgver}/${_pkgname}.service"
}

# TODO: better build from source
# build() {}

package() {
    install -Dm755 "${srcdir}/usr/sbin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname}-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/doc/${pkgname}-${pkgver}/LICENSE.txt"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname}-${pkgver}/README.txt" "${pkgdir}/usr/share/doc/${pkgname}-${pkgver}/README.txt"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname}-${pkgver}/agent.yml.example" "${pkgdir}/usr/share/doc/${pkgname}-${pkgver}/agent.yml.example"
    install -Dm644 "${srcdir}/usr/share/${pkgname}-${pkgver}/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    install -Dm644 "sensu.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm644 "sensu.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}

