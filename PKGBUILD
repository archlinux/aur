# Maintainer: witt <1989161762 at qq dot com>
pkgname=alisase
pkgver=3.4.2
pkgrel=4
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
source=(
    "${pkgname}-${pkgver}.deb::https://sase-app.oss-cn-hangzhou.aliyuncs.com/linux/sase-app-latest.deb"
    "alisase.service"
)
sha256sums=('34032a08479ca6f41e5e0574bad5a0740245a3d4a28706c7b9b3c0e659d0e53d'
            'a1df4fed3d17a4f52394037129410de342fcc8eb4eab9131b3dece4ba2ebaea4')

build() {
    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.deb"
    bsdtar -xf "${srcdir}/data."*
}

package() {
    install -Dm755 "${srcdir}/usr/local/bin/${pkgname}" -t "${pkgdir}/usr/local/bin/"
    install -Dm755 "${srcdir}/alisase.service" -t "${pkgdir}/usr/lib/systemd/system/"
    cp -r "${srcdir}/usr/local/bin/${pkgname}-bin" "${pkgdir}/usr/local/bin/"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications/"
}
