# maintainer: Ricardo Band <email@ricardo.band>

pkgname=cephadm-git
pkgver=18.0.0.r5894.gf9a01cf3851
pkgrel=1
pkgdesc='Cephadm deploys and manages a Ceph cluster by connection to hosts from the manager daemon via SSH to add, remove, or update Ceph daemon containers'
arch=('any')
url="https://ceph.com/"
license=('GPL2' 'LGPL2.1' 'LGPL3')
depends=('lvm2' 'python>=3')
makedepends=('git')
optdepends=('podman: container backend'
            'docker: container backend'
            'chrony: time sync service'
            'ntp: time sync service')
provides=('cephadm')
conflicts=('cephadm')
source=("git+https://github.com/ceph/ceph")
sha256sums=('SKIP')

pkgver() {
    cd $srcdir/ceph
    git describe --long | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
    cd $srcdir/ceph/src/cephadm/
    ./build.sh $srcdir/cephadm
    install -Dm0755 $srcdir/cephadm $pkgdir/usr/bin/cephadm
}

