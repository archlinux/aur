#Maintainer: Iwan Timmer <irtimmer@gmail.com>

pkgname=docker-swarm
pkgver=1.1.2
pkgrel=1
pkgdesc="A Docker-native clustering system"
depends=('glibc')
makedepends=('go' 'godep')
arch=('x86_64' 'i686')
source=("https://github.com/docker/swarm/archive/v$pkgver.tar.gz")
url="https://github.com/docker/swarm/"
license=("Apache")
sha256sums=('e177feba9ecfbf548f39e59103a858a915e8e8d745a19651b57f1e5e6264eced')

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
}
