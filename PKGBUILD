# Maintainer: RangHo Lee <hello@rangho.me>

pkgbase=suite
pkgver=2.0.1
pkgrel=4
pkgname=(
    "otf-${pkgbase}"
    "ttf-${pkgbase}"
    "ttf-${pkgbase}-variable"
    "woff2-${pkgbase}-variable"
    "woff2-${pkgbase}"
)
pkgdesc="A Korean UI headline typeface focused on clarity."
url="https://github.com/sunn-us/SUITE"
arch=('any')
license=('OFL')
source=(
    "https://github.com/sunn-us/SUITE/releases/download/v${pkgver}/SUITE-otf.zip"   
    "https://github.com/sunn-us/SUITE/releases/download/v${pkgver}/SUITE-ttf.zip"   
    "https://github.com/sunn-us/SUITE/releases/download/v${pkgver}/SUITE-Variable-ttf.zip"
    "https://github.com/sunn-us/SUITE/releases/download/v${pkgver}/SUITE-Variable-woff2.zip"
    "https://github.com/sunn-us/SUITE/releases/download/v${pkgver}/SUITE-woff2.zip"   
)
sha256sums=(
    "4a86b15809fa5f5629c6e77467881d8a8f90766c0f01af55a2ba73cfa724e488"
    "8ddfbcfef4305cd852b616ebd65a19bc9837935a6751ce6f90f5f0989bc3e5c2"
    "b0f76136917c8451e5316d6e232e04b720a9c45c0dd1d3e2025f0b8fa6398270"
    "7b76436864c95a4966375f2a8801943ae7f3ac1f289873e3a86ad1d78955f7fb"
    "3a17f4c6ab9317dcf1d6b2bdfc980315c7d0316115ea6b1ee7508f3dc6eb5cb7"
)

prepare() {
    # Remove macOS resource fork
    find . -type d -name '__MACOSX' -exec rm -rf {} +
}

package_otf-suite() {
    install -Dm644 *.otf -t "$pkgdir"/usr/share/fonts/OTF
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_ttf-suite() {
    find . -name '*.ttf' -not -name '*Variable*' -exec install -Dm644 -t "$pkgdir"/usr/share/fonts/TTF {} +
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_ttf-suite-variable() {
    find . -name '*Variable.ttf' -exec install -Dm644 -t "$pkgdir"/usr/share/fonts/TTF {} +
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_woff2-suite-variable() {
    find . -name '*Variable.woff2' -exec install -Dm644 -t "$pkgdir"/usr/share/fonts/WOFF2 {} +
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_woff2-suite() {
    find . -name '*.woff2' -not -name '*Variable*' -exec install -Dm644 -t "$pkgdir"/usr/share/fonts/WOFF2 {} +
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
