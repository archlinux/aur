# Maintainer: Tim Paik <timpaik@163.com>

_pkgname='libvppinfra'
pkgname="$_pkgname-bin"
pkgver=21.10.1
pkgrel=1
pkgdesc="Vector Packet Processing -- runtime libraries"
arch=('x86_64')
url="https://fd.io/"
license=('Apache')
depends=()
provides=("${_pkgname}")
source=("$pkgname-$pkgver.deb::https://packagecloud.io/fdio/release/packages/ubuntu/bionic/${_pkgname}_${pkgver}-release_amd64.deb/download.deb")
noextract=("$pkgname-$pkgver.deb")
sha256sums=('b5431cc9e962c16665b7c1c5cdb7af3d996af28c85ef72ffd38dab0edb001400')

package() {
    bsdtar -O -xf $pkgname-$pkgver.deb data.tar.xz | bsdtar -C "$pkgdir" -xJf -
    for file in $(find ${pkgdir}/usr/lib -type f -or -type l -and -name \*); do
        mv ${file} ${pkgdir}/usr/lib
    done
    rmdir "${pkgdir}/usr/lib/x86_64-linux-gnu"
}
