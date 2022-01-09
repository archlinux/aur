# Maintainer: Juma7C9 <juri at dividebyzero dot it>

pkgname=cie-middleware-bin
pkgver=1.4.1
pkgrel=2
pkgdesc="Middleware della CIE (Carta di Identità Elettronica) per Linux - Upstream Release"
arch=('x86_64')
url="https://developers.italia.it/it/cie"
license=('BSD')
depends=('gcc-libs' 'glibc' 'openssl' 'java-runtime' 'pcsclite')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-git")
install="${pkgname%-bin}.install"

source=("https://github.com/italia/${pkgname%-bin}-linux/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}.tar.gz"
        'LICENSE')

sha256sums=('5c75a19f30bca3d9f7735102c45e05376d7845917803f3fa0d8e2a393b90d8bc'
            'bf2723ca68a1f406557a3174f9195dbdc6171cbf8f7ad83f56546ac592a9ea8e')

package() {
    cd "${srcdir}/${pkgname%-bin}_${pkgver}"

    install -dm 755                     ${pkgdir}/usr/share/CIEID
    install -Dm 644 CIEID/*             ${pkgdir}/usr/share/CIEID/
    install -Dm 755 libcie-pkcs11.so	${pkgdir}/usr/lib/libcie-pkcs11.so
    install -Dm 644 cieid.desktop       ${pkgdir}/usr/share/applications/cieid.desktop
    install -Dm 644 ../LICENSE          ${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE
}
