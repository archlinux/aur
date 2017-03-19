# Maintainer: Newb I the Newbd <czbd hostedon o2 halfacolon pl>
# Contributor: Martin Wimpress <code@flexion.org>

_ver=1.14
_pkgbase=mate-session-manager
pkgname=(${_pkgbase}-gtk2)
pkgver=${_ver}.1
pkgrel=1
pkgdesc="The MATE Session Handler (GTK2 version)"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('mate-desktop-gtk2' 'mate-polkit-gtk2' 'mate-settings-daemon-gtk2')
makedepends=('intltool')
optdepends=('gnome-keyring: keyring support'
            'xdg-user-dirs-gtk: manage user directories')
groups=('mate-gtk2')
conflicts=("${_pkgbase}" "${_pkgbase}-gtk3")
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
sha1sums=('385fdef7045a6a5abe42756b992b2f2f46e2bbdb')

build() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    ./configure \
        --prefix=/usr \
        --libexecdir=/usr/lib/${_pkgbase} \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --with-gtk=2.0 \
        --disable-upower
    make
}

package() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
