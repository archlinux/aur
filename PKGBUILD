# Maintainer: Scarecrow928 <yushuaibin999 at gmail dot com>

pkgname=dracula-gtk-theme-full
_pkgname=${pkgname%-full}
pkgver=v4.0.0
pkgrel=1
pkgdesc="Dark theme for GTK"
arch=("any")
url="https://github.com/dracula/gtk"
license=('GPL')
makedepends=(git)
optdepends=('ttf-roboto: primary font face defined'
	'ttf-ubuntu-font-family: secondary font face defined'
	'cantarell-fonts: tertiary font face defined')
source=("$_pkgname::git+$url.git#tag=$pkgver")
sha256sums=('SKIP')
provides=($_pkgname)
conflicts=($_pkgname)
_filenames=(
    assets
    cinnamon
    gnome-shell
    gtk-2.0
    gtk-3.0
    gtk-3.20
    gtk-4.0
    metacity-1
    unity
    xfwm4
    LICENSE
    README.md
    index.theme
)

package() {
    cd $srcdir/$_pkgname

    _install_prefix=$pkgdir/usr/share/themes/Dracula
    mkdir -p $_install_prefix \
        $pkgdir/usr/share/aurorae/themes \
        $pkgdir/usr/share/sddm/themes
    for filename in "${_filenames[@]}"; do
        cp -a $filename $_install_prefix
    done

    # kde
    cd $srcdir/$_pkgname/kde
    cp -a aurorae/* $pkgdir/usr/share/aurorae/themes
    cp -a color-schemes $pkgdir/usr/share
    cp -a plasma $pkgdir/usr/share
    cp -a sddm/* $pkgdir/usr/share/sddm/themes
}