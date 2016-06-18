# Maintainer: Phillip Schichtel <phillip.public@schich.tel>
pkgname=adapta-gtk-theme
_gtk3_min='3.18'
_gtk3_max='3.21'
_theme_name=Adapta
pkgver="${_gtk3_max}.2.132"
pkgrel=1
pkgdesc="An adaptive Gtk+ theme based on Material Design Guidelines."
arch=(any)
url="https://github.com/tista500/${_theme_name}"
license=('GPL2' 'CCPL')
depends=('gtk2>=2.24.29'
         "gtk3>=${_gtk3_min}"
         "gtk3<=${_gtk3_max}.99")
optdepends=("gnome-shell>=${_gtk3_min}: The GNOME Shell"
            "gnome-flashback>=${_gtk3_min}: The GNOME flashback shell"
            'budgie-desktop>=10.2.4: The Budgie desktop'
            'cinnamon>=2.8: The Cinnamon desktop'
            'xfdesktop>=4.12.2: The Xfce desktop'
            'paper-icon-theme: A fitting icon theme'
            'gnome-tweak-tool: A graphical tool to tweak gnome settings'
            "unity>=7.4.0: Ubuntu's Unity desktop")
makedepends=('glib2>=2.48.0'
             'libxml2'
             'ruby-bundler>=1.11.0'
             'ruby-sass>=3.4.21'
             'inkscape')
_tri_fadeno="tri-fadeno.jpg"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        "${pkgver}-${_tri_fadeno}::${url}/raw/master/.github/img/${_tri_fadeno}")
sha256sums=('a50f38471a983d19ac1f0c64cd57bbad1ed44508007d98456c2eb6bc5b853483'
            '807bd3d99fb492569caf050cfa9b5c75d4e6a072007637fe8e583a3f5c0bea24')

build() {
    cd "${_theme_name}-${pkgver}"
    ./autogen.sh --prefix "${pkgdir}/usr" --enable-gtk_next --enable-chrome --enable-plank
    make
}

package() {
    cd "${_theme_name}-${pkgver}"
    make install

    # The backgrounds
    bgdir="${pkgdir}/usr/share/backgrounds/${_theme_name}"
    install -dm755 "$bgdir"
    cp -dp --no-preserve=ownership "$(readlink "${srcdir}/${pkgver}-${_tri_fadeno}")" "${bgdir}/${_tri_fadeno}"
}

