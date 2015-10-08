#Maintainer: Iwan Timmer <irtimmer@gmail.com>

pkgname=docker-swarm
pkgver=0.4.0
pkgrel=1
pkgdesc="A Docker-native clustering system"
depends=('glibc')
makedepends=('go' 'godep')
arch=('x86_64' 'i686')
source=("https://github.com/docker/swarm/archive/v$pkgver.tar.gz")
url="https://github.com/docker/swarm/"
license="BSD"
sha256sums=('c3ee1a34ce86da4d31f652c871dfa120fc78d5cc835e391034d740e83b48f7a3')

prepare() {
    cd $srcdir

    mkdir -p src/github.com/docker
    mv swarm-${pkgver} src/github.com/docker/swarm
    
    cd src/github.com/docker/swarm
    GOPATH=$srcdir godep get
}

build() {
    cd $srcdir/src/github.com/docker/swarm
    
    GOPATH=$srcdir godep go build
}

package() {
    cd $srcdir/src/github.com/docker/swarm

    install -Dm755 swarm $pkgdir/usr/bin/swarm
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
