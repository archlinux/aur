# Maintainer: Matthew Ellison <matt(at)arroyo(dot)io>

_pkgname='vpp-lib'
pkgname="${_pkgname}-bin"
pkgver=18.07.1
pkgrel=2
pkgdesc="FD.io Vector Packet Processing - Libraries"
arch=('x86_64')
url="https://fd.io/"
license=('Apache')
depends=('glibc' 'gcc-libs' 'openssl')
provides=("${_pkgname}")
source=("https://packagecloud.io/fdio/release/packages/ubuntu/bionic/${_pkgname}_${pkgver}-release_amd64.deb/download.deb")
noextract=("download.deb")
sha256sums=('fc2938dc7b1a659c8a4c9534e9ff07b3c570d7b239be9459cfcfb5cae77f2b85')

package() {
    bsdtar -O -xf download.deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf -
    # Move the Libraries to /usr/lib
    for file in $(find ${pkgdir}/usr/lib -type f -or -type l -and -name \*); do
        mv ${file} ${pkgdir}/usr/lib
    done
    rmdir "${pkgdir}/usr/lib/x86_64-linux-gnu"
}
