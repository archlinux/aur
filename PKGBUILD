# Maintainer: Karim Vergnes <me@thesola.io>

pkgbase=ipu6-camera-bin
pkgname=(intel-ipu6-camera-bin intel-ipu6ep-camera-bin)
_pkgname=ipu6-camera-bins
pkgver=r32.0797f74
pkgrel=1
pkgdesc="Intel IPU6 camera binaries"
arch=('x86_64')
url="https://github.com/intel/ipu6-camera-bins"
license=('unknown')
depends=('intel-ipu6-dkms-git' 'glibc')
makedepends=('git')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd $_pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_intel-ipu6-camera-bin() {
    provides=(ipu6-camera-bin)
    conflicts=(intel-ipu6ep-camera-bin)
    pkgdesc+=" (Tiger Lake)"

    install -dm755 "$pkgdir/usr"
    cp -rT "$_pkgname/ipu6/lib" "$pkgdir/usr/lib"
    cp -rT "$_pkgname/ipu6/include" "$pkgdir/usr/include"
}

package_intel-ipu6ep-camera-bin() {
    provides=(ipu6-camera-bin)
    conflicts=(intel-ipu6-camera-bin)
    pkgdesc+=" (Alder Lake)"

    install -dm755 "$pkgdir/usr"
    cp -rT "$_pkgname/ipu6ep/lib" "$pkgdir/usr/lib"
    cp -rT "$_pkgname/ipu6ep/include" "$pkgdir/usr/include"
}
