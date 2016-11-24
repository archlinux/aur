# Maintainer:   Νικόλαος Κυριάκος Φυτίλης <n-fit@live.com>
# Contributor:  eadrom <eadrom@archlinux.info>
# Contributor:  Martin Wimpress <code@flexion.org>

_ver=1.17
_pkgbase=mate-screensaver
pkgname="${_pkgbase}-dev"
pkgver=${_ver}.0
pkgrel=1
pkgdesc='Screensaver for MATE'
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
provides=("${_pkgbase}" "${_pkgbase}-gtk3")
conflicts=("${_pkgbase}" "${_pkgbase}-gtk3")
license=('GPL')
depends=('dbus-glib' 'glib2' 'libmatekbd-dev' 'libnotify' 'libxss'
         'mate-desktop-dev' 'mate-menus-dev' 'mate-session-manager-dev')
makedepends=('intltool>=0.50.1')
optdepends=('mate-power-manager: Add power management support.'
            'mate-screensaver-hacks: Additional screensavers.'
            'rss-glx: Really slick screensavers.')
groups=('mate-extra')
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
sha1sums=('c676ba7203a4f8ef9279ea9fb0a05950a10b74f7')

prepare() {
    cd "${srcdir}"
    mv "${_pkgbase}-${pkgver}" "${_pkgbase}-gtk3"
}

build() {
    cd "${srcdir}/${_pkgbase}-gtk3"
    ./configure \
        --prefix=/usr \
        --libexecdir=/usr/lib/${_pkgbase} \
        --sysconfdir=/etc \
        --with-xscreensaverdir=/usr/share/xscreensaver/config \
        --with-xscreensaverhackdir=/usr/lib/xscreensaver \
        --with-mit-ext \
        --with-libnotify \
        --enable-locking \
        --with-gtk=3.0 \
        --without-console-kit \
        --disable-static
    make
}

package() {
    pkgdesc+=' (GTK3 version)'
    cd "${srcdir}/${_pkgbase}-gtk3"
    make DESTDIR="${pkgdir}" install
}
