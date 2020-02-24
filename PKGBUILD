# Maintainer: David Adler <d.adler@posteo.de>

_pkgname=gnucap-custom
pkgname=$_pkgname-git
pkgver=r38.cb4639b
pkgrel=1
pkgdesc="customisable executable + a few plugins for gnucap"
arch=('x86_64')
url="https://codeberg.org/gnucap/gnucap-custom"
license=('GPL')
depends=('gnucap-git' 'boost')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://codeberg.org/gnucap/$_pkgname.git#branch=master")
md5sums=('SKIP')


pkgver() {
    cd $_pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $_pkgname
    ./configure 
    make
}

check() {
    cd $_pkgname
    make check
}

package() {
    cd $_pkgname
    make DESTDIR="$pkgdir/" install
}

