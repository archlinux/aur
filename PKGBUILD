# Maintainer: Harryhaha <harry_haha@foxmail.com>

pkgname=nusget
pkgver=1.5.3
pkgrel=1
pkgdesc='A modern and supercharged NUS downloader built with Python and Qt6.'
url='https://github.com/NinjaCheetah/NUSGet'
license=('MIT')
arch=('x86_64')
provides=("${pkgname}")
conflicts=("${pkgname}" "${pkgname}-git")
depends=('pyside6' 'python-libwiipy' 'python-libtwlpy' 'python-zstandard' 'python-requests' 'python-imageio')

source=("${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "nusget.sh"
        "NUSGet.desktop")

sha256sums=('80bcaf206c9887a2a13d558d24af2585e966c04ddf10f4727b89a548ecd80bb6'
            '54028ef9c52d91c84e516e41610b0a41460f5c9281ac8cd6ec3fe9d2e342b09a'
            'b716b8e601b673029646be7bac936eb1f2829329dbb826da96be830223b94e72')

package() {
    cd "${srcdir}"
    install -Dm 755 nusget.sh "${pkgdir}/usr/bin/nusget"
    install -Dm 644 "NUSGet-${pkgver}/packaging/icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/NUSGet.png"
    install -Dm 755 NUSGet.desktop -t "${pkgdir}/usr/share/applications/"
    cd "NUSGet-${pkgver}"
    find . -type d -exec install -d {} "${pkgdir}/opt/${pkgname}/"{} \;
    find . -type f -exec install -Dm 644 {} "${pkgdir}/opt/${pkgname}/"{} \;
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
