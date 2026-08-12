# maintainer: Ricardo Band <email@ricardo.band>

pkgname=cephadm-git
pkgver=21.3.0.r1963.g5995d21863b
pkgrel=1
pkgdesc='Cephadm deploys and manages a Ceph cluster by connection to hosts from the manager daemon via SSH to add, remove, or update Ceph daemon containers'
arch=('any')
url="https://ceph.com/"
license=('LGPL-2.0-or-later')
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

