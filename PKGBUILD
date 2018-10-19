# Maintainer: David Adler <d.adler@posteo.de>

_pkgname=gnucap-custom
pkgname=$_pkgname-git
pkgver=r33.0483cea
pkgrel=1
pkgdesc="customisable executable + a few plugins for gnucap"
arch=('x86_64')
url="https://gitlab.com/gnucap/gnucap-custom"
license=('GPL')
depends=('gnucap')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://gitlab.com/gnucap/$_pkgname.git")
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

