# Maintainer: perqin <perqinxie at gmail dot com>

pkgname=sublime-text-3-imfix
pkgver=3.3207
pkgrel=1
pkgdesc='Sophisticated text editor for code, markup and prose - Stable build with input method support for CJK users'
arch=('x86_64')
url='https://www.sublimetext.com/3'
license=('custom')
depends=('libpng' 'gtk2')
conflicts=('sublime-text' 'sublime-text-dev' 'sublime-text-nightly' 'sublime-text-dev-imfix' 'sublime-text-dev-imfix2')
provides=('sublime-text' 'sublime-text-dev' 'sublime-text-nightly' 'sublime-text-dev-imfix' 'sublime-text-dev-imfix2')
source=(
    "https://download.sublimetext.com/sublime_text_3_build_${pkgver:2}_x64.tar.bz2"
    'LICENSE'
)
sha256sums=(
    'acb64f1de024a0f004888096afa101051e48d96c7a3e7fe96e11312d524938c4'
    '8e4c48469bf3f35d0c0904e770c4e307d4965a8931e839c01c5765498a19cf01'
)

package() {
    cd "${srcdir}"
    # Install sublime text 3
    install -dm755 "${pkgdir}/opt"
    cp --preserve=mode -r "sublime_text_3" "${pkgdir}/opt/sublime_text_3"
    # Install icons
    for res in 128x128 16x16 256x256 32x32 48x48; do
        install -dm755 "${pkgdir}/usr/share/icons/hicolor/${res}/apps"
        ln -s "/opt/sublime_text_3/Icon/${res}/sublime-text.png" "${pkgdir}/usr/share/icons/hicolor/${res}/apps/sublime-text.png"
    done
    # Install desktop entry and executable
    install -dm755 "${pkgdir}/usr/share/applications"
    install -Dm644 "sublime_text_3/sublime_text.desktop" "${pkgdir}/usr/share/applications/sublime_text.desktop"
    sed -i 's#/opt/sublime_text/sublime_text#subl#g' "${pkgdir}/usr/share/applications/sublime_text.desktop"
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/sublime_text_3/sublime_text" "${pkgdir}/usr/bin/subl"
    # Install license file
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
