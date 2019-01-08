#Maintainer: Nissar Chababy <funilrys at outlook dot com>
#Ex-Maintainer: Iwan Timmer <irtimmer@gmail.com>

pkgname=docker-swarm
pkgver=1.2.9
pkgrel=1
pkgdesc="A Docker-native clustering system"
depends=('glibc')
makedepends=('go')
arch=('x86_64' 'i686')
source=("https://github.com/docker/swarm/archive/v$pkgver.tar.gz")
url="https://github.com/docker/swarm/"
license=("Apache")
sha512sums=('8707e9de8d1e123d627674c8b320920000fa093347e1b74f657bc254445a222019c3f3d57bef6cd6496f8758cbbf653e7fa47b41e1f7d0604b1eadef1baa6d55')

prepare() {
    cd $srcdir
    
    mkdir -p src/github.com/docker
    mv swarm-${pkgver} src/github.com/docker/swarm
    
    export GOPATH=$srcdir
}

build() {
    cd $srcdir/src/github.com/docker/swarm
    
    go install .
}

package() {
    install -Dm755 bin/swarm $pkgdir/usr/bin/swarm
    install -Dm644 src/github.com/docker/swarm/LICENSE.code $pkgdir/usr/share/licenses/$pkgname/LICENSE
    install -Dm644 src/github.com/docker/swarm/LICENSE.docs $pkgdir/usr/share/licenses/$pkgname/LICENSE.docs
}