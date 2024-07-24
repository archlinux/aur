# Maintainer: SoftExpert <softexpert at gmail dot com>

pkgname=yaak-app
pkgver=2024.6.6
pkgrel=1
pkgdesc="Yaak is a cross-platform desktop app for interacting with REST, GraphQL, gRPC and OpenAPI."
arch=('x86_64')
url="https://yaak.app/"
license=('unknown')
depends=('glibc' 'hicolor-icon-theme' 'webkit2gtk-4.1' 'gtk3')
provides=(${pkgname})
conflicts=(${pkgname})
options=(!strip)

source=("${pkgname}-${pkgver}.deb::https://releases.yaak.app/releases/${pkgver}/yaak_${pkgver}_amd64.deb")
sha256sums=('e779497e68861aacffc05600fe5ebabf75c82dd4bd5c2953ba0238667cbd083f')

package() {
    bsdtar -O -xf ${pkgname}-${pkgver}.deb data.tar.gz | bsdtar -C "${pkgdir}" -xJf -
    tar xf "${srcdir}"/data.tar.gz

    rm -rf ${pkgdir}/usr/bin

#    install -Dm755 "${srcdir}/usr/bin/node" "${pkgdir}/usr/local/bin/node"
    install -Dm755 "${srcdir}/usr/bin/protoc" "${pkgdir}/usr/local/bin/protoc"
    install -Dm755 "${srcdir}/usr/bin/${pkgname}" "${pkgdir}/usr/local/bin/${pkgname}"
}
