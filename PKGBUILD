# Maintainer: Markus Hubig <mhubig@gmail.com>
pkgname=sheepdog
pkgver=1.0_rc0
pkgrel=1
pkgdesc="This package provides a distributed storage system for QEMU. It provides highly available block level storage volumes to virtual machines. It supports advanced volume management features such as snapshot, cloning, and thin provisioning."
arch=('i686' 'x86_64')
url="http://sheepdog.github.io/sheepdog/"
license=('GPL2')

depends=('fuse>=2.9.5'
         'corosync>=2.3.5')

optdepends=('qemu: needed on the client'
        'curl: for http request service'
            'fcgi: for http request service')

makedepends=('libqb>=0.17.2'
             'liburcu>=0.8.7'
             'qemu>=2.5.0'
             'yasm>=1.3.0')

source=("https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('8d3fdb58ac4d62e814a11f191d83baa783a7e805f6400eb6807719760f10e49aaad28c68c7c1a95bc535bc1c15722d43458bf4f3342696d58624baab2af1436d')

build() {
    cd "$pkgname-$pkgver"
    ./autogen.sh
    ./configure --enable-sheepfs --prefix=/usr --exec-prefix=/usr --sysconfdir=/etc --sbindir=/usr/bin
    make
}

check() {
    cd "$pkgname-$pkgver"
    make -k check
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
