# Maintainer: Newb I the Newbd <czbd hostedon o2 halfacolon pl>
# Contributor: Martin Wimpress <code@flexion.org>

_ver=1.16
_pkgbase=mate-screensaver
pkgname=(${_pkgbase}-gtk2)
pkgver=${_ver}.1
pkgrel=3
pkgdesc='Screensaver for MATE (GTK2 version)'
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libmatekbd-gtk2' 'libnotify' 'libxss' 'mate-desktop-gtk2' 'mate-menus-gtk2' 'mate-session-manager-gtk2')
makedepends=('intltool')
optdepends=('mate-screensaver-hacks: Additional screensavers'
            'rss-glx: Really slick screensavers')
groups=('mate-extra-gtk2')
conflicts=("${_pkgbase}")
provides=("${_pkgbase}")
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
sha1sums=('81dc31f96028a168456b8435e291090b789a3bea')

build() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    ./configure \
        --prefix=/usr \
        --libexecdir=/usr/lib/${_pkgbase} \
        --sysconfdir=/etc \
        --with-xscreensaverdir=/usr/share/xscreensaver/config \
        --with-xscreensaverhackdir=/usr/lib/xscreensaver \
        --with-mit-ext \
        --with-libnotify \
        --enable-locking \
        --with-gtk=2.0 \
        --without-console-kit
    make
}

package() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
