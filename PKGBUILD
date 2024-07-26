# Maintainer: SoftExpert <softexpert at gmail dot com>

_app_name=yaak-app
pkgname=${_app_name}-beta
pkgver=2024.7.0
_betaver=beta.9
pkgrel=9
pkgdesc="Yaak is a cross-platform desktop app for interacting with REST, GraphQL, gRPC and OpenAPI."
arch=('x86_64')
url="https://yaak.app/"
license=('unknown')
depends=('glibc' 'hicolor-icon-theme' 'webkit2gtk-4.1' 'gtk3')
provides=(${_app_name})
conflicts=(${_app_name})
options=(!strip)

source=("${pkgname}-${pkgver}-${_betaver}.deb::https://releases.yaak.app/releases/${pkgver}-${_betaver}/yaak_${pkgver}-${_betaver}_amd64.deb")
sha256sums=('c11516c70e59453ce0784543333aae8875ceda4a3e46b2a79c226b3345e0cdf8')

package() {
    bsdtar -O -xf ${pkgname}-${pkgver}-${_betaver}.deb data.tar.gz | bsdtar -C "${pkgdir}" -xJf -
    tar xf "${srcdir}"/data.tar.gz

    rm -rf ${pkgdir}/usr/bin

    # install -Dm755 "${srcdir}/usr/bin/node" "${pkgdir}/usr/local/bin/node"
    # install -Dm755 "${srcdir}/usr/bin/protoc" "${pkgdir}/usr/local/bin/protoc"
    # install -Dm755 "${srcdir}/usr/bin/${_app_name}" "${pkgdir}/usr/local/bin/${_app_name}"

    cp -ar usr/{bin,lib,share} "${pkgdir}/usr"
}
