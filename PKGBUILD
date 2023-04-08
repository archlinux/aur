# Maintainer: Ismael Gutiérrez González <frodo_gv@hotmail.com>
pkgname=('rpfm-bin')
pkgver=4.0.14
pkgrel=1
pkgdesc="A modding tool for modern (since Empire) Total War games. Precompiled version."
arch=('x86_64')
url="https://github.com/Frodo45127/rpfm"
license=('MIT')
depends=('libgit2' 'xz' 'p7zip' 'qt5-base' 'qt5-imageformats' 'kcompletion' 'kiconthemes'  'ktexteditor' 'kxmlgui' 'kwidgetsaddons' 'breeze-icons')
provides=('rpfm')
conflicts=('rpfm-git')
_programname=('rpfm')

source_x86_64=("$url/releases/download/v${pkgver}/rpfm-v${pkgver}-x86_64-unknown-linux-gnu.tar.zst")
sha256sums_x86_64=('1159d8167321f9d1ffe9e66c8e46e5e5c23ab5bc94753cb46807830f8d49099e')

package() {

    # All files should already follow the proper structure inside the tar.gz
    # That means we just need to install the executables with different permissions.
    install -D -m755 "$srcdir/usr/bin/rpfm_ui" "$pkgdir/usr/bin/rpfm_ui"
    install -D -m755 "$srcdir/usr/bin/rpfm_cli" "$pkgdir/usr/bin/rpfm_cli"

    # The icons.
    cd "$srcdir/usr/share/$_programname/icons/"
    for icon in *; do
        install -D -m644 $icon "$pkgdir/usr/share/$_programname/icons/$icon"
    done

    # The language files.
    cd "$srcdir/usr/share/$_programname/locale/"
    for locale in *; do
        install -D -m644 $locale "$pkgdir/usr/share/$_programname/locale/$locale"
    done

    # The UI files.
    cd "$srcdir/usr/share/$_programname/ui/"
    for ui_template in *; do
        install -D -m644 $ui_template "$pkgdir/usr/share/$_programname/ui/$ui_template"
    done

    # Shortcut.
    install -D -m644 "$srcdir/usr/share/applications/rpfm.desktop" "$pkgdir/usr/share/applications/rpfm.desktop"

    # License.
    install -D -m644 "$srcdir/usr/share/licenses/$_programname/LICENSE" "$pkgdir/usr/share/licenses/$_programname/LICENSE"
}

