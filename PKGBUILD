# Maintainer: David Mazieres (http://www.scs.stanford.edu/~dm/addr/)
pkgname=nvidia-mft
pkgver=4.36.0
pkgverrel=147
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
b2sums=('d2652a34c3294b1505102c51ec728641aca122343c5c5d94e8f942878931f1cc69f9a27e2f12ea1851f0dd5a8d10e1be532ea41fb110975f4855cc4247a61dd3')

package() {
    for deb in mft-${pkgversarch}-deb/*DEBS/*.deb; do
	bsdtar xOf "$deb" data.tar.gz data.tar.gz | bsdtar xC "$pkgdir"
    done

    cd "$pkgdir"
    sed -ie 's/(arch)/(uname -m)/' usr/src/kernel-mft-dkms-*/dkms.conf
    rm -rf usr/lib
    mv usr/lib64 usr/lib
}
