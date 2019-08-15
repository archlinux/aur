# Maintainer: Newb I the Newbd <czbd hostedon o2 halfacolon pl>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: tobias <tobias funnychar archlinux.org>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>

_pkgbase=xfce4-settings
pkgname=(${_pkgbase}-gtk2)
pkgver=4.12.4
pkgrel=1
pkgdesc="A settings manager for Xfce (GTK2 version)"
arch=('x86_64')
url="https://www.xfce.org/"
license=('GPL2')
groups=('xfce4-gtk2')
conflicts=("${_pkgbase}")
provides=("${_pkgbase}")
depends=('exo' 'garcon' 'libxfce4ui-gtk2' 'libnotify' 'libxklavier'
         'adwaita-icon-theme' 'gnome-themes-standard')
makedepends=('intltool' 'xf86-input-libinput')
optdepends=('libcanberra: for sound control')
source=(https://archive.xfce.org/src/xfce/${_pkgbase}/${pkgver%.*}/${_pkgbase}-${pkgver}.tar.bz2
        default-xsettings-xml.patch)
sha256sums=('e2a04cad48bf9e951409d0c841829fa3b4ce632cd799082ef82d0506618b6f9b'
            '8e9a6c70ab0ceb5d91b637dc290768f8a47edb5d7b6e2eebc4459dbc4ee040d7')
prepare() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"

    # Enable GNOME icon theme, Adwaita theme and font hinting by default
    patch -Np1 -i "${srcdir}/default-xsettings-xml.patch"
}

build() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"

    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --disable-static \
        --enable-xrandr \
        --enable-xcursor \
        --enable-libnotify \
        --enable-libxklavier \
        --enable-pluggable-dialogs \
        --enable-sound-settings \
        --disable-upower-glib \
        --disable-debug
    make
}

package() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
