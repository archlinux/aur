# Maintainer: witt <1989161762 at qq dot com>
pkgname=alisase
pkgver=3.4.2
pkgrel=3
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
    "alisased.sh"
    "alisase.service"
)
sha256sums=('34032a08479ca6f41e5e0574bad5a0740245a3d4a28706c7b9b3c0e659d0e53d'
            'b333f9e53356b6ae536d9f71e91227c4b09a8319169efe624abea3fbbf68180d'
            '7dc90a93793628ae2b997af147450c935f7a74e8e6ae7d8db69f69e27b9f1d44')

build() {
    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.deb"
    bsdtar -xf "${srcdir}/data."*
}

package() {
    install -Dm755 "${srcdir}/usr/local/bin/${pkgname}" -t "${pkgdir}/usr/local/bin/"
    install -Dm755 "${srcdir}/alisased.sh" -t "${pkgdir}/usr/local/bin/alisase-bin/"
    install -Dm755 "${srcdir}/alisase.service" -t "${pkgdir}/usr/lib/systemd/system/"
    cp -r "${srcdir}/usr/local/bin/${pkgname}-bin" "${pkgdir}/usr/local/bin/"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications/"
}
