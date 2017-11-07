# Maintainer: Bryn Edwards <bryn at openmailbox dot org>
# Contributor: Timothée Ravier <tim@siosm.fr>

pkgname=docker2aci
pkgver=0.17.1
pkgrel=1
pkgdesc="CLI tool to convert Docker images to ACI"
arch=('x86_64' 'i686')
url="https://github.com/appc/docker2aci"
source=("https://github.com/appc/docker2aci/archive/v${pkgver}.tar.gz")
sha1sums=('3c661ae92adf0ed27f8ac5d634b407c2b5d6697b')
license=('Apache2')
makedepends=('go' 'bash')
conflicts=('docker2aci-git')

prepare() {
    cd ${pkgname}-${pkgver}
    # Instead of getting version from git, use ${pkgver}.
    # The git command output is different but it still seems to build
    sed -i "s/\$(git describe --dirty --always)/v${pkgver}/" build.sh
}

build() {
    cd ${pkgname}-${pkgver}
    sh build.sh
}

package() {
    cd ${pkgname}-${pkgver}
    install -D -m 0755 "bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -D -m 0644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
