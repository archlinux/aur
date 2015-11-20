#Maintainer: Iwan Timmer <irtimmer@gmail.com>

pkgname=flannel
pkgver=0.5.5
pkgrel=1
pkgdesc="Etcd backed network fabric for containers"
depends=('glibc')
makedepends=('go')
arch=('x86_64' 'i686')
source=("https://github.com/coreos/flannel/archive/v$pkgver.tar.gz"
        "flannel.service")
url="https://github.com/coreos/flannel"
license="APACHE"
sha256sums=('dbbcb08c0e70713b0c920387a9967e5b30ef833c8118c847edbbca4f68ff0562'
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
