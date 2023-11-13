# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Dāvis Mosāns <davispuh at gmail dot com>

_pkgname=qt5-translations
pkgname=$_pkgname-git
pkgver=v5.15.11.lts.lgpl.r0.g5606515
pkgrel=1
pkgdesc='A cross-platform application and UI framework (Translations)'
arch=('i686' 'x86_64')
url='https://code.qt.io/cgit/qt/qttranslations.git'
license=('GPL3')
depends=('qt5-base-git' 'qt5-tools-git')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://invent.kde.org/qt/qt/qttranslations.git#branch=kde/5.15")
sha256sums=("SKIP")

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir"
    mkdir -p build
}

build() {
    cd "$srcdir/build"
    qmake "../$_pkgname"
    make
}

package() {
    cd "$srcdir/build"

    make INSTALL_ROOT="$pkgdir" install

    mkdir -p "${pkgdir}"/usr/share/licenses/"${pkgname}"
    install -D -m644 $srcdir/$_pkgname/LICENSE.* "${pkgdir}"/usr/share/licenses/"${pkgname}"/
}
