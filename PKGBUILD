# Maintainer: David Adler <d.adler@posteo.de>
# Maintainer: Felix Salfelder <felix aet salfelder dott org>

_pkgname=gnucap
pkgname=$_pkgname-git
pkgver=dev.0831.r0.gf1c8c78
pkgrel=3
pkgdesc="GNU Circuit Analysis Package (develop branch)"
arch=('x86_64')
url="http://gnucap.org/"
license=('GPL')
depends=('readline' 'termcap')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+git://git.sv.gnu.org/$_pkgname.git#branch=develop")
md5sums=('SKIP')

pkgver() {
    cd $_pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
    cd $_pkgname
    sed -i 's#INSTALL_SYSCONF_DIR = $(PREFIX)/etc#INSTALL_SYSCONF_DIR = /etc#' main/Make1
    sed -i 's#$\\{prefix\\}/etc#/etc#' main/configure
}

build() {
    cd $_pkgname
    ./configure --prefix=/usr --sysconfdir=/etc
    make
}

package() {
    cd $_pkgname
    make DESTDIR="$pkgdir/" install
}

