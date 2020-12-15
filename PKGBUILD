# Maintainer: Librewish <librewish@gmail.com>
# Contributer : Guinux <nuxgui@gmail.com>

pkgname=mhwd-nvidia
pkgver=455.45.01
pkgrel=2
pkgdesc="mhwd-nvidia pci id"
arch=("any")
url="https://garudalinux.org/"
license=('GPL2')
source=('mhwd-nvidia')
makedepends=('nvidia-dkms' 'nvidia-utils')
sha256sums=('738749f5ada14afac3085d10fac351c55d423674228eea1dae8e41b935d1497c')
provides=('mhwd-nvidia')
package() {

    install -d -m755 "$pkgdir/var/lib/mhwd/ids/pci/"

    # Generate mhwd database
    sh -e $srcdir/mhwd-nvidia \
    /usr/share/doc/nvidia/README \
    /usr/src/nvidia-$pkgver/nvidia/nv-kernel.o_binary \
    > $pkgdir/var/lib/mhwd/ids/pci/nvidia.ids
    # add PCIID: 1b82 Nvidia Gforce 1070 Ti
    sed -i 's/1b81 1b84/1b81 1b82 1b84/g' $pkgdir/var/lib/mhwd/ids/pci/nvidia.ids
}
