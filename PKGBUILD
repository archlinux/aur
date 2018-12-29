# Maintainer: Ricardo (XenGi) Band <email@ricardo.band>
pkgname=sensu-go-backend
pkgver=5.1.0
_pkgver=5.1.0-0ubuntu18.1
pkgrel=2
pkgdesc="Sensu Go Backend"
arch=('x86_64')
url='https://sensu.io'
license=('MIT')
makedepends=('')
source=("${pkgname}-${_pkgver}_amd64.deb::https://packagecloud.io/sensu/stable/packages/ubuntu/cosmic/${pkgname}_${_pkgver}_amd64.deb/download.deb"
        "sensu.sysusers"
        "sensu.tmpfiles")
sha1sums=('15b439316b5bfb798a92efde8ac40113d3334ea5'
          '054c2cfb7b2c4e6900fe79620b40fd060dbc0d8a'
          '9cca06fcbb23d5618382cc14e4ab4cc73c1f91fa')

prepare() {
    cd "${srcdir}"
    tar xaf data.tar.gz
    # change /usr/sbin to /usr/bin
    sed -i 's/\/usr\/sbin\//\/usr\/bin\//g' "${srcdir}/usr/share/sensu-go-backend-5.1.0/sensu-backend.service"
}

# TODO: better build from source
# build() {}

package() {
    install -Dm755 "${srcdir}/usr/sbin/sensu-backend" "${pkgdir}/usr/bin/sensu-backend"
    install -Dm644 "${srcdir}/usr/share/doc/sensu-go-backend-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/doc/sensu-go-backend-${pkgver}/LICENSE.txt"
    install -Dm644 "${srcdir}/usr/share/doc/sensu-go-backend-${pkgver}/README.txt" "${pkgdir}/usr/share/doc/sensu-go-backend-${pkgver}/README.txt"
    install -Dm644 "${srcdir}/usr/share/doc/sensu-go-backend-${pkgver}/backend.yml.example" "${pkgdir}/usr/share/doc/sensu-go-backend-${pkgver}/backend.yml.example"
    install -Dm644 "${srcdir}/usr/share/sensu-go-backend-5.1.0/sensu-backend.service" "${pkgdir}/usr/lib/systemd/system/sensu-backend.service"
    install -Dm644 "sensu.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm644 "sensu.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}

