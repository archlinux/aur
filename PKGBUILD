# Maintainer: 0strodamus <0strodamus at cox dot net>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>
#
# last Meld GTK2 version

pkgname=meld-gtk2
_pkgname=meld
pkgver=1.8.6
pkgrel=1
pkgdesc='Visual diff and merge tool'
url='http://meldmerge.org/'
license=('GPL')
arch=('any')
makedepends=('intltool' 'gnome-doc-utils')
depends=('pygtk' 'hicolor-icon-theme' 'desktop-file-utils')
optdepends=('pygtksourceview2: syntax highlighting'
            'python2-dbus: open a new tab in an already running instance'
            'python2-gconf: gnome integration')
provides=('meld')
conflicts=('meld')
replaces=('meld')
options=('!emptydirs')
install=meld.install
source=("http://ftp.gnome.org/pub/gnome/sources/${_pkgname}/${pkgver%.*}/${_pkgname}-${pkgver}.tar.xz")
sha1sums=('33e23f2e56b27f2ac5cd21032c7eefe9dd469480')

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    sed -i 's/env python/env python2/' bin/meld
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make PYTHON=/usr/bin/python2 prefix=/usr
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make PYTHON=/usr/bin/python2 prefix=/usr DESTDIR="${pkgdir}" install
}
