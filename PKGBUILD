# Maintainer: witt <1989161762 at qq dot com>
pkgname=alisase
pkgver=3.4.2
pkgrel=2
pkgdesc="Aliyun sase client."
arch=(
    'x86_64'
)
url="https://www.aliyun.com/product/security/csas"
license=('custom')
conflicts=("${pkgname}" "${pkgname}-bin")
provides=("${pkgname}-bin" "${pkgname}")
options=(
    '!strip'
)
install="${pkgname}.install";
source=("${pkgname}-${pkgver}-${pkgrel}.deb::https://sase-app.oss-cn-hangzhou.aliyuncs.com/linux/sase-app-latest.deb")
sha256sums=('34032a08479ca6f41e5e0574bad5a0740245a3d4a28706c7b9b3c0e659d0e53d')

build() {
    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}-${pkgrel}.deb"
    bsdtar -xf "${srcdir}/data."*
}

package() {
    install -Dm755 "${srcdir}/usr/local/bin/${pkgname}" -t "${pkgdir}/usr/local/bin/"
    cp -r "${srcdir}/usr/local/bin/${pkgname}-bin" "${pkgdir}/usr/local/bin/"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications/"
}
