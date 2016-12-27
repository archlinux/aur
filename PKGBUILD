#Maintainer: Iwan Timmer <irtimmer@gmail.com>

pkgname=flannel
pkgver=0.6.2
pkgrel=1
pkgdesc="Etcd backed network fabric for containers"
depends=('glibc')
makedepends=('go')
arch=('x86_64' 'i686')
source=("https://github.com/coreos/flannel/archive/v$pkgver.tar.gz"
        "flannel.service")
url="https://github.com/coreos/flannel"
license=("APACHE")
sha256sums=('40c315ee78e50b97d2e48e5c32e2d07690b7361fe1ca09efe16d3edda4bc7e33'
            '3ec927a5a545293541e800057c3c0b85fcd5161071526a8fc9666caa0801c80f')

build() {
    cd $srcdir/flannel-$pkgver
    
    ./build
}

package() {
    cd $srcdir/flannel-$pkgver

    install -Dm755 bin/flanneld $pkgdir/usr/bin/flannel
    install -Dm644 $srcdir/flannel.service $pkgdir/usr/lib/systemd/system/flannel.service
}
