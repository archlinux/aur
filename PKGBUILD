# Maintainer: Aaron Fischer <mail@aaron-fischer.net>
# Contributor: Steven Allen <steven@stebalien.com>
# Contributor: trile7 at gmail dot com
# Contributor: Ernia <monghitri@aruba.it>

pkgname=yad
pkgver=2.0
pkgrel=1
pkgdesc="A fork of zenity - display graphical dialogs from shell scripts or command line"
url="https://github.com/v1cont/yad"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('gtk3' 'webkit2gtk' 'gtkspell3')
makedepends=('autoconf' 'automake' 'intltool')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('958c2f3dd6e62815fd89d43d3657445bbc9d08180e4527c5c556220f6a5647783bb1520a41dfef5c63e0e9c500ca0d55b66eabd374a3da680e603394e1e06173')
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    autoreconf -ivf
    intltoolize
    LIBS="-lglib-2.0" ./configure \
      --prefix=/usr \
      --with-gtk=gtk3 \
      --enable-icon-browser \
      --enable-html \
      --enable-gio \
      --enable-spell \
      --enable-sourceview

    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}

