# Maintainer: Phillip Schichtel <phillip.public@schich.tel>
pkgname=adapta-gtk-theme
_gtk3_version='3.21'
_theme_name=Adapta
pkgver="${_gtk3_version}.2.51"
pkgrel=1
pkgdesc="An adaptive Gtk+ theme based on Material Design Guidelines."
arch=(any)
url="https://github.com/tista500/${_theme_name}"
license=('GPL2' 'CCPL')
depends=('gtk2>=2.24.29'
         'gtk3>=3.18'
         "gtk3<=${_gtk3_version}.99")
optdepends=('gnome-shell>=3.18: The GNOME Shell'
            'gnome-flashback>=3.18: The GNOME flashback shell'
            'budgie-desktop>=10.2.4: The Budgie desktop'
            'cinnamon>=2.8: The Cinnamon desktop'
            'xfdesktop>=4.12.2: The Xfce desktop'
            'paper-icon-theme: A fitting icon theme'
            'gnome-tweak-tool: A graphical tool to tweak gnome settings'
            "unity>=7.4.0: Ubuntu's Unity desktop")
_tri_fadeno="tri-fadeno.jpg"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        "${pkgver}-${_tri_fadeno}::${url}/raw/master/img/tri-fadeno.jpg")
sha256sums=('c5edfe45c56f29d170b69e775eb373d502a59421734f91d7a3bd04f1a7c501ca'
            '807bd3d99fb492569caf050cfa9b5c75d4e6a072007637fe8e583a3f5c0bea24')

build() {
    cd "${_theme_name}-${pkgver}"
    ./autogen.sh --prefix "${pkgdir}/usr" --enable-gtk_next --enable-chrome
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

