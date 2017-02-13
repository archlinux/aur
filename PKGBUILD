# Maintainer: Laurent Treguier <laurent@treguier.org>

pkgname=oomox
pkgver=1.0.1
pkgrel=1
pkgdesc='Graphical application for generating different color variations of Numix theme (GTK2, GTK3), gnome-colors and ArchDroid icon themes.
Have a hack for HiDPI in gtk2.'
arch=('i686' 'x86_64')
url='https://github.com/actionless/oomox'
license=('GPL3')
depends=(
    'bash'
    'bc'
    'zip'
    'glib2'
    'gdk-pixbuf2'
    'ruby-sass'
    'python-gobject'
    'gtk-engine-murrine'
    'gtk-engines'
)
optdepends=(
    'xorg-xrdb: for the `xresources` theme'
    'imagemagick: for icon theme generation'
    'inkscape: for icon theme generation'
    'gksu: for applying Spotify theme from GUI'
    'gnome-colors-common-icon-theme: for using the generated icon theme'
)
provides=('oomox')
conflicts=('oomox-git')
source=(
    "https://github.com/actionless/oomox/archive/${pkgver}.tar.gz"
    'oomox-cli'
    'oomox-gui'
    'oomox-gnome-colors-icons-cli'
    'oomox-archdroid-icons-cli'
    'oomoxify-cli'
    'oomox.desktop'
)
md5sums=('9f803539dd8f2c565abe6d1be9c35208'
         'cf96db21684e4e0df1f9a14b3aae65bb'
         '0d156463416bbc2260c073c15b7f2a70'
         '57cfcc4141ce6e346da7ab8bab411b14'
         'f01aa2280f8e03d6244fe6284c44a03b'
         'a9e990b0c4c0ee3be2f195c9c25d36e6'
         '44b3eb47786551b2f2bf805d33935025')

package() {
    install -d "${pkgdir}/opt/oomox"
    mv "${srcdir}/${pkgname}-${pkgver}"/* "${pkgdir}/opt/oomox"
    install -d "${pkgdir}/usr/bin/"
    install -d "${pkgdir}/usr/share/applications/"

    for script in oomox-cli oomox-gui oomox-gnome-colors-icons-cli oomox-archdroid-icons-cli oomoxify-cli
    do
        install -Dm755 "${srcdir}/${script}" "${pkgdir}/usr/bin"
    done

    install -Dm644 "${srcdir}/oomox.desktop" "${pkgdir}/usr/share/applications"
}
