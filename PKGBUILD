# Maintainer: witt <1989161762 at qq dot com>

pkgname=fcitx5-theme-mint
pkgver=0.0.1
pkgrel=1
url='https://github.com/witt-bit/fcitx5-theme-mint'
pkgdesc='Mint Input Method Style Fcitx5 themes.'
arch=('any')
license=('Apache-2.0')
conflicts=('fcitx5-theme-mint')
provides=('fcitx5-theme-mint')
options=('!strip')
optdepends=(
    'otf-apple-pingfang: PingFang fonts for Chinese'
)
source=(
    "themes-${pkgver}.tar.gz::${url}/releases/download/${pkgver}/themes.tar.gz"
    "license-${pkgver}::${url}/raw/master/LICENSE"
)
sha256sums=('84cf5a24f9b4281901cc24ea6931309ed522561e8b44ae37ba19144c1551ff7a'
            'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')

prepare() {
    if [ -d "${srcdir}/target/" ]; then
        rm -rf "${srcdir}/themes/";
        mv "${srcdir}/target/themes" -f "${srcdir}/"
        rm -r "${srcdir}/target/";
    fi
}

package() {
    find "${srcdir}/themes" -type f | while read -r theme; do
        install -Dm644 "${theme}" "${pkgdir}/usr/share/fcitx5/themes/${theme#*themes/}";
    done
    install -Dm644 "${srcdir}/license-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
