# Maintainer: Juma7C9 <juri at dividebyzero dot it>
# Contributor: TesX <tesfabpel at gmail dot com>
# Contributor: rogueai <aur dot ax9kq at simplelogin dot com>

pkgname=cie-middleware-bin
pkgver=1.4.3.12
pkgrel=1
pkgdesc="Middleware della CIE (Carta di Identità Elettronica) per Linux - Upstream Release"
arch=('x86_64')
url="https://developers.italia.it/it/cie"
license=('BSD')
depends=('gcc-libs' 'glibc' 'openssl' 'java-runtime' 'pcsclite')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-git")
install="${pkgname%-bin}.install"

_gh_dir="${pkgver}"
_gh_ver=$(sed 's/\(.*\)\./\1-/' <<< "${pkgver}")
_gh_file_base="CIE-Middleware-${_gh_ver}"

source=("https://github.com/italia/${pkgname%-bin}-linux/releases/download/${_gh_dir}/${_gh_file_base}.x86-64.tar.gz"
        'LICENSE')

sha256sums=('8a3bf7708f58fd73658b2a270d420f0c1a3ec9b9e1f09e3e24ac9de399e8eb25'
            'bf2723ca68a1f406557a3174f9195dbdc6171cbf8f7ad83f56546ac592a9ea8e')

package() {
    cd "${srcdir}"

    install -dm 755                                            ${pkgdir}/usr/share/CIEID
    install -Dm 644 usr/share/CIEID/*                          ${pkgdir}/usr/share/CIEID/
    install -Dm 755 usr/local/lib/libcie-pkcs11.so             ${pkgdir}/usr/lib/libcie-pkcs11.so
    install -Dm 644 usr/share/applications/cieid.desktop       ${pkgdir}/usr/share/applications/cieid.desktop
    install -Dm 644 ../LICENSE                                 ${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE
}
