# Maintainer:  Peter Mattern <pmattern at arcor dot de>

_pkgname=lxmenu-data
pkgname=$_pkgname-git
pkgver=0.1.4.4.ge0da9fc
pkgrel=2
pkgdesc='freedesktop.org application menu definition files for LXDE'
arch=('i686' 'x86_64')
url='https://github.com/lxde/lxmenu-data'
license=('LGPL')
makedepends=('git' 'intltool')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/lxde/lxmenu-data.git")
sha256sums=("SKIP")

pkgver() {
    cd $_pkgname
    git describe --always | sed "s/release_//;s/_/./g;s/-/./g"
}

build() {
    cd $_pkgname
    ./autogen.sh
    ./configure --prefix=/usr --sysconfdir=/etc
    make
}

package() {
    cd $_pkgname
    make DESTDIR=$pkgdir install
}
