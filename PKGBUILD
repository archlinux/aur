# Maintainer: 64bitman <chen.foxe@gmail.com>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Aaron Fischer <mail@aaron-fischer.net>
# Contributor: Steven Allen <steven@stebalien.com>
# Contributor: trile7 at gmail dot com
# Contributor: Ernia <monghitri@aruba.it>

pkgname=yad-git
_pkgname=yad
pkgver=v13.0.r7.g92a7978
pkgrel=1
pkgdesc="A fork of zenity - display graphical dialogs from shell scripts or command line"
url="https://github.com/v1cont/yad"
arch=('x86_64')
license=('GPL3')
depends=('gtk3>=3.22.0' 'webkit2gtk-4.1' 'gspell' 'gtksourceview3')
makedepends=('autoconf' 'automake' 'intltool>=0.40.0')
source=("git+${url}")
sha256sums=('SKIP')
provides=('yad')
conflicts=('yad')

pkgver() {
    cd "$_pkgname"
    git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}"
    autoreconf -ivf
    intltoolize
    ./configure --prefix=/usr --enable-icon-browser --enable-html --enable-spell --enable-sourceview
    make
}

package() {
    cd "${srcdir}/${_pkgname}"
    make DESTDIR="${pkgdir}" install
}

# vim: sw=4
