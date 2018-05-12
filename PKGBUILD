# Maintainer: Jianfeng Zhang <swordfeng123@gmail.com>

pkgname=mom
pkgver=0.5.12
pkgrel=1
pkgdesc="Memory Overcommitment Manager, for virtual machines"
arch=('x86_64')
url="https://gerrit.ovirt.org/#/admin/projects/mom"
license=("GPL2")
depends=('python2')
makedepends=('git')
source=("git+https://gerrit.ovirt.org/mom#tag=v${pkgver}")
md5sums=('SKIP')

prepare() {
    cd mom
    sed -i 's/\/usr\/bin\/env python/\/usr\/bin\/env python2/' momd
}

build() {
    cd mom
    ./autogen.sh
    PYTHON=/usr/bin/python2 ./configure --prefix=/usr --sbindir=/usr/bin
    make
}

package() {
    cd mom
    make DESTDIR="${pkgdir}" install
}
