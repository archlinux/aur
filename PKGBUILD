# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: marcospb19 <marcospb19@hotmail.com>

pkgname=sublime-text-3
pkgver=3.3211
pkgrel=2
pkgdesc="Sophisticated text editor for code, html and prose - stable build"
arch=('x86_64')
url='https://www.sublimetext.com/3'
license=('custom')
depends=('libpng' 'gtk2')
install="${pkgname}.install"
source=("https://download.sublimetext.com/sublime_text_3_build_${pkgver:2}_x64.tar.bz2")
sha256sums=('0b3c8ca5e6df376c3c24a4b9ac2e3b391333f73b229bc6e87d0b4a5f636d74ee')

package() {
    cd "${srcdir}"

    # Adjust naming
    sed -i 's#/opt/sublime_text/sublime_text#/opt/sublime_text_3/sublime_text#g' "sublime_text_3/sublime_text.desktop"
    sed -i 's#Sublime Text#Sublime Text 3#g' "sublime_text_3/sublime_text.desktop"
    sed -i 's#sublime-text#sublime-text-3#g' "sublime_text_3/sublime_text.desktop"

    # Install sublime text 3
    install -dm755 "${pkgdir}/opt"
    cp --preserve=mode -r "sublime_text_3" "${pkgdir}/opt/sublime_text_3"

    # Install icons
    for res in 128x128 16x16 256x256 32x32 48x48; do
        install -dm755 "${pkgdir}/usr/share/icons/hicolor/${res}/apps"
        ln -s "/opt/sublime_text_3/Icon/${res}/sublime-text.png" "${pkgdir}/usr/share/icons/hicolor/${res}/apps/sublime-text-3.png"
    done

    # Install desktop entry and executable
    sed -i 's#/opt/sublime_text_3/sublime_text#/usr/bin/subl3#g' "sublime_text_3/sublime_text.desktop"

    install -dm755 "${pkgdir}/usr/share/applications"
    install -Dm644 "sublime_text_3/sublime_text.desktop" "${pkgdir}/usr/share/applications/sublime_text_3.desktop"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/sublime_text_3/sublime_text" "${pkgdir}/usr/bin/subl3"
}
