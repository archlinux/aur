# Maintainer: Bryn Edwards <bryn at openmailbox dot org>
pkgname=docker2aci
pkgver=v0.16.0
pkgrel=1
pkgdesc="CLI tool to convert Docker images to ACI."
arch=('x86_64' 'i686')
url="https://github.com/appc/docker2aci"
source=("https://github.com/appc/docker2aci/archive/$pkgver.tar.gz")
sha1sums=('c44dcee55355ec29c798e2fe625ea78f196cdb59')
license=('Apache2')
makedepends=('go')
conflicts=('docker2aci-bin' 'docker2aci-git')

package() {
    mkdir -p $pkgdir/usr/bin/
    cd $srcdir/$pkgname-${pkgver:1}/

    # Instead of getting version from git, use $pkgver.
    # The git command output is different but it still seems to build
    sed -i "s/\$(git describe --dirty --always)/${pkgver}/" build.sh

    sh build.sh
    cp bin/$pkgname $pkgdir/usr/bin/

    mkdir -p $pkgdir/usr/share/licenses/$pkgname/
    cp LICENSE $pkgdir/usr/share/licenses/$pkgname/
}
