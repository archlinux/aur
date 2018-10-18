# Maintainer: David Adler <d.adler@posteo.de>

_pkgname=nekostring
pkgname=$_pkgname-git
pkgver=r5.22927db
pkgrel=1
pkgdesc="DSSI plugin emulating a 70s-era string ensemble"
arch=('x86_64')
url="https://github.com/gordonjcp/nekostring"
license=('GPL')
depends=('gtk2' 'liblo')
makedepends=('git' 'dssi') 
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(git+https://github.com/gordonjcp/nekostring.git)
md5sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd $_pkgname
    ./autogen.sh
    ./configure  --prefix=/usr
}

package() {
	cd $_pkgname
    make DESTDIR="$pkgdir/" install
    install -t "$pkgdir/usr/share/doc/$_pkgname/" \
        -vDm 644 README.md
}

