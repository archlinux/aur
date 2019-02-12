# Maintainer: Aaron Fischer <mail@aaron-fischer.net>
# Contributor: Steven Allen <steven@stebalien.com>
# Contributor: trile7 at gmail dot com
# Contributor: Ernia <monghitri@aruba.it>

pkgname=yad
pkgver=0.41.0
pkgrel=1
pkgdesc="A fork of zenity - display graphical dialogs from shell scripts or command line"
url="https://github.com/v1cont/yad"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('gtk3' 'webkit2gtk')
makedepends=('autoconf' 'automake' 'intltool')
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('47befc927f2db19796e34a563b93934081d2f2c666f11d68e5584eef548e046c6d912c0017f933a5ec908537b39b0ea05515f97d589dedc24f9bd2c3a5bb5e3f')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    autoreconf -ivf
    intltoolize
    ./configure \
      --prefix=/usr \
      --with-gtk=gtk3 \
      --enable-icon-browser \
      --enable-html \
      --enable-gio \
      --enable-spell \
      --enable-sourceview

    ./configure --prefix=/usr --enable-icon-browser --enable-html --enable-gio --enable-spell --enable-sourceview
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}

