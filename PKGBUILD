# Maintainer: David Mazieres (http://www.scs.stanford.edu/~dm/addr/)
pkgname=nvidia-mft
pkgver=4.35.0
pkgverrel=159
pkgversarch="${pkgver}-${pkgverrel}-$(uname -m)"
pkgrel=1
epoch=
pkgdesc="NVIDIA Mellanox firmware tools (MFT)"
arch=(x86_64)
url="https://network.nvidia.com/products/adapter-software/firmware-tools/"
license=('custom')
groups=()
depends=(dkms usbutils python)
makedepends=()
checkdepends=()
optdepends=(linux-firmware-mellanox rdma-core linux-headers linux-lts-headers)
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
install=
changelog=
source=("https://www.mellanox.com/downloads/MFT/mft-${pkgver}-${pkgverrel}-x86_64-deb.tgz")
noextract=()
b2sums=('6cee60dcc46bc4030e23033c83462d5eec55872978d8acacd67ee63a240fa6f6e45e9f86422014a8d30e7e7ea21bc99e5e80b291d73ec19385aad5657afef9e4')
validpgpkeys=()

package() {
    for deb in mft-${pkgversarch}-deb/*DEBS/*.deb; do
	bsdtar xOf "$deb" data.tar.gz data.tar.gz | bsdtar xC "$pkgdir"
    done

    cd "$pkgdir"
    sed -ie 's/(arch)/(uname -m)/' usr/src/kernel-mft-dkms-*/dkms.conf
    rm -rf usr/lib
    mv usr/lib64 usr/lib
}
