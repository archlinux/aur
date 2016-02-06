#Maintainer: Iwan Timmer <irtimmer@gmail.com>

pkgname=runc
pkgver=0.0.7
pkgrel=1
pkgdesc="Container CLI tools"
depends=('glibc')
makedepends=('godep' 'go')
arch=('x86_64' 'i686')
source=("https://github.com/opencontainers/runc/archive/v$pkgver.tar.gz")
url="http://runc.io/"
license=("APACHE")
sha256sums=('4d446cc796e32376f9227f7f2c2a05645874e063010cde1618b30a552caba7e0')

prepare() {
    cd $srcdir/runc-$pkgver
    mkdir -p Godeps/_workspace/src/github.com/opencontainers
    ln -sfT ../../../../../ Godeps/_workspace/src/github.com/opencontainers/runc
}

build() {
    cd $srcdir/runc-$pkgver
    godep go build -o runc .
}

package() {
    cd $srcdir/runc-$pkgver
    install -Dm755 runc $pkgdir/usr/bin/runc
}
