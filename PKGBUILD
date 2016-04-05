#Maintainer: Iwan Timmer <irtimmer@gmail.com>

pkgname=runc
pkgver=0.0.9
pkgrel=1
pkgdesc="Container CLI tools"
depends=('glibc')
makedepends=('godep' 'go')
arch=('x86_64' 'i686')
source=("https://github.com/opencontainers/runc/archive/v$pkgver.tar.gz")
url="http://runc.io/"
license=("APACHE")
sha256sums=('f5f8acdef11c2feb65b27d605e590b57e0c0568b52b99fbd4e6faf67c178196d')

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
