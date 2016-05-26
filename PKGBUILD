# Maintainer: Phillip Schichtel <phillip.public@schich.tel>
pkgname=adapta-gtk-theme
_gtk3_version='3.21'
pkgver="${_gtk3_version}.1.249"
pkgrel=1
pkgdesc="An adaptive Gtk+ theme based on Material Design Guidelines."
arch=(any)
url="https://github.com/tista500/Adapta"
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
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tista500/Adapta/archive/${pkgver}.tar.gz"
        'https://github.com/tista500/Adapta/raw/master/img/tri-fadeno.jpg')
sha256sums=('48d713ae3ab117a7775f9f32e159adad4a3db5bb3094b45a4c7aa308c383bd56'
            '807bd3d99fb492569caf050cfa9b5c75d4e6a072007637fe8e583a3f5c0bea24')

build() {
    cd "Adapta-${pkgver}"
    ./autogen.sh --prefix "${pkgdir}/usr" --enable-gtk_next --enable-chrome
    make
}

package() {
    cd "Adapta-${pkgver}"
    make install

    # The backgrounds
    bgdir="${pkgdir}/usr/share/backgrounds"
    install -dm755 "$bgdir"
    cp -dp --no-preserve=ownership "${srcdir}/tri-fadeno.jpg" "$bgdir"
}

