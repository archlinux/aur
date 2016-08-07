# Maintainer:   Νικόλαος Κυριάκος Φυτίλης <n-fit@live.com>
# Contributor:  eadrom <eadrom@archlinux.info>
# Contributor:  Martin Wimpress <code@flexion.org>

_ver=1.15
_pkgbase=caja-extensions
pkgname=('caja-extensions-common-1.15-gtk3' 'caja-gksu-1.15-gtk3' 'caja-image-converter-1.15-gtk3' 'caja-open-terminal-1.15-gtk3' 'caja-sendto-1.15-gtk3' 'caja-share-1.15-gtk3')
pkgver=${_ver}.0
pkgrel=3
pkgdesc="MATE extensions for Caja (GTK3 version)"
url="http://mate-desktop.org"
arch=("i686" "x86_64")
license=("GPL")
depends=("caja-1.15-gtk3" "dbus-glib" "gksu" "gtk3" "gupnp" "imagemagick" "samba")
groups=("mate-extra")
makedepends=("mate-common-1.15-gtk3" "caja-1.15-gtk3")
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
sha1sums=("f4299e99fe889038834ab9743cf6418f01a777cc")

prepare() {
    cd "${srcdir}"
    mv "${_pkgbase}-${pkgver}" "${_pkgbase}-gtk3"
}

build() {
    cd "${srcdir}/${_pkgbase}-gtk3"
    PYTHON=/usr/bin/python2 ./configure \
        --prefix=/usr \
        --with-gtk=3.0
    make
}

package_caja-extensions-common-1.15-gtk3() {
    pkgdesc="Caja extensions common files (GTK3 version)"
    conflicts=("caja-extensions-common" "caja-extensions-common-gtk3")
    cd "${srcdir}/${_pkgbase}-gtk3"
    make -C po DESTDIR="${pkgdir}" install
}

package_caja-gksu-1.15-gtk3() {
    pkgdesc="Privilege granting extension for Caja using gksu (GTK3 version)"
    depends=("caja-1.15-gtk3" "caja-extensions-common-1.15-gtk3" "gksu")
    groups=("mate-extra")
    conflicts=("caja-gksu" "caja-gksu-gtk3")
    cd "${srcdir}/${_pkgbase}-gtk3"
    make -C gksu DESTDIR="${pkgdir}" install
}

package_caja-image-converter-1.15-gtk3() {
    pkgdesc="A Caja extension for simple image conversions (GTK3 version)"
    depends=("caja-1.15-gtk3" "caja-extensions-common-1.15-gtk3" "imagemagick")
    groups=("mate-extra")
    conflicts=("caja-image-converter" "caja-image-converter-gtk3")
    cd "${srcdir}/${_pkgbase}-gtk3"
    make -C image-converter DESTDIR="${pkgdir}" install
}

package_caja-open-terminal-1.15-gtk3() {
    pkgdesc="A Caja extension for opening terminals in arbitrary local paths (GTK3 version)"
    depends=("caja-1.15-gtk3" "caja-extensions-common-1.15-gtk3" "glib2")
    groups=("mate-extra")
    conflicts=("caja-open-terminal" "caja-open-terminal-gtk3")
    cd "${srcdir}/${_pkgbase}-gtk3"
    make -C open-terminal DESTDIR="${pkgdir}" install
}

package_caja-sendto-1.15-gtk3() {
    pkgdesc="A Caja extension for sending files (GTK3 version)"
    depends=("caja-1.15-gtk3" "caja-extensions-common-1.15-gtk3" "dbus-glib" "glib2" "gupnp")
    groups=("mate-extra")
    optdepends=("pidgin: Support for sending to instant messaging networks."
                "gajim: Support for sending to Jabber.")
    conflicts=("caja-sendto" "caja-sendto-gtk3")
    cd "${srcdir}/${_pkgbase}-gtk3"
    make -C sendto DESTDIR="${pkgdir}" install
}

package_caja-share-1.15-gtk3() {
    pkgdesc="A Caja extension to quickly share a folder (GTK3 version)"
    depends=("caja-1.15-gtk3" "caja-extensions-common-1.15-gtk3" "samba")
    groups=("mate-extra")
    conflicts=("caja-share" "caja-share-gtk3")
    cd "${srcdir}/${_pkgbase}-gtk3"
    make -C share DESTDIR="${pkgdir}" install
}
