#Maintainer: Nissar Chababy <funilrys at outlook dot com>
#Ex-Maintainer: Iwan Timmer <irtimmer@gmail.com>

pkgname=docker-swarm
pkgver=1.2.6
pkgrel=1
pkgdesc="A Docker-native clustering system"
depends=('glibc')
makedepends=('go' 'godep')
arch=('x86_64' 'i686')
source=("https://github.com/docker/swarm/archive/v$pkgver.tar.gz")
url="https://github.com/docker/swarm/"
license=("Apache")
sha512sums=('3857036c625f36a75d50803d4ab5daed3e926f3a5044558bed36272add7210c0c0df79274dcd2daf265551aca066dd5b86861f251aac4a0ebbd6c00ad60e8c2a')

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
