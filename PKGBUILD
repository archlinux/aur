# Maintainer: Aaron Fischer <mail@aaron-fischer.net>
# Contributor: Steven Allen <steven@stebalien.com>
# Contributor: trile7 at gmail dot com
# Contributor: Ernia <monghitri@aruba.it>

pkgname=yad-git
_pkgname=yad
pkgver=9267829
pkgrel=1
pkgdesc="A fork of zenity - display graphical dialogs from shell scripts or command line"
url="http://github.com/v1cont/yad"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('gtk3' 'webkit2gtk')
makedepends=('autoconf' 'automake' 'intltool')
source=("git+${url}")
sha256sums=('SKIP')
provides=('yad')
conflicts=('yad')

build() {
    cd "${srcdir}/${_pkgname}"
    autoreconf -ivf
    intltoolize
    ./configure --prefix=/usr --with-gtk=gtk3 --enable-icon-browser --enable-html
    make
}

package() {
    cd "${srcdir}/${_pkgname}"
    make DESTDIR="${pkgdir}" install
}