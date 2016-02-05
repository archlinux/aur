#Maintainer: Iwan Timmer <irtimmer@gmail.com>

pkgname=docker-swarm
pkgver=1.1.0
pkgrel=1
pkgdesc="A Docker-native clustering system"
depends=('glibc')
makedepends=('go' 'godep')
arch=('x86_64' 'i686')
source=("https://github.com/docker/swarm/archive/v$pkgver.tar.gz")
url="https://github.com/docker/swarm/"
license=("BSD")
sha256sums=('463aa579a0c43f2874bb14f37bac0ce4ae233672f84360d398a206d18e706cf5')

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
