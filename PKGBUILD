#Maintainer: Iwan Timmer <irtimmer@gmail.com>

pkgname=runc
pkgver=0.0.8
pkgrel=1
pkgdesc="Container CLI tools"
depends=('glibc')
makedepends=('godep' 'go')
arch=('x86_64' 'i686')
source=("https://github.com/opencontainers/runc/archive/v$pkgver.tar.gz")
url="http://runc.io/"
license=("APACHE")
sha256sums=('2eceec063264f65ed40729432638e73f996fc6a8994591d6f96bb82596dcb2cb')

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
