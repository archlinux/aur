# Maintainer: Andrej Marolt <andrej.marolt@gmail.com>
pkgname=openshift-origin-git
pkgver=1.0.0
pkgrel=1
pkgdesc="OpenShift Origin is a platform for developing, building, and deploying containerized applications. See https://docs.openshift.org/latest for more on running OpenShift Origin."
arch=(x86_64)
url="https://github.com/openshift/origin"
license=('Apache')
depends=('docker')
optdepends=('zfs-dkms: zfs support')
install=install.sh
if [[ $CARCH == 'x86_64' ]]; then
    source=("https://github.com/openshift/origin/archive/master.zip")
sha256sums=('SKIP')
fi

build() {
    export GOPATH=$(pwd)
    export OS_GIT_VERSION=
    export OS_GIT_MAJOR=
    export OS_GIT_MINOR=

    cd ./origin-master
    make clean build
    cd ./_output/local/bin/linux/amd64/
    mv ./openshift $srcdir/
    mv ./oc        $srcdir/
}

package() {
    install -D -m755 $srcdir/oc        $pkgdir/usr/bin/oc
    install -D -m755 $srcdir/openshift $pkgdir/usr/bin/openshift
}
