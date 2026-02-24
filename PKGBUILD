# Maintainer: you
pkgname=voquill
pkgver=0.0.432
pkgrel=1
pkgdesc='AI voice dictation'
arch=('x86_64')
url='https://github.com/josiahsrc/voquill'
license=('custom:proprietary')
depends=(
    'gtk3'
    'webkit2gtk-4.1'
    'xdotool'
    'libayatana-appindicator'
    'alsa-lib'
    'libxtst'
)
options=('!strip')
_tag="desktop-v${pkgver}"
source=("Voquill_${pkgver}_amd64.deb::https://github.com/josiahsrc/voquill/releases/download/${_tag}/Voquill_${pkgver}_amd64.deb")
sha256sums=('06deff2b70b75729d307b7d01fc597fa165f0e1d2f57de3e086cb22fd1761a5d')

prepare() {
    cd "${srcdir}"
    ar x "Voquill_${pkgver}_amd64.deb"
    tar -xzf data.tar.gz
}

package() {
    cd "${srcdir}"

    install -Dm755 usr/bin/Voquill "${pkgdir}/usr/bin/Voquill"

    install -Dm644 usr/share/applications/Voquill.desktop \
        "${pkgdir}/usr/share/applications/Voquill.desktop"

    for size in 32x32 128x128 256x256@2; do
        install -Dm644 "usr/share/icons/hicolor/${size}/apps/Voquill.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}/apps/Voquill.png"
    done
}
