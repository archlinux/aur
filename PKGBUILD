# Maintainer: Librewish <librewish@gmail.com>
# Maintainer: TNE <tne at garudalinux org>
# Contributer : Guinux <nuxgui@gmail.com>

pkgname=mhwd-nvidia
pkgver=550.67.1
pkgrel=1
pkgdesc="NVIDIA pci id list for MHWD"
arch=("any")
url="https://garudalinux.org/"
license=('custom')
source=('mhwd-nvidia')
makedepends=('nvidia-dkms' 'nvidia-utils')
sha256sums=('fc77d5f4bf9df15afb33c85cf957294a0e942aa23ee730d8fc45b2d8b2853950')

# Automatically update the pkgver based on the version of nvidia-dkms installed
pkgver() {
    pacman -Rddp --print-format %v nvidia-dkms | head -c -1 | sed 's/-/./g'
}

package() {
    install -d -m755 "$pkgdir/var/lib/mhwd/ids/pci/"

    local _version="${pkgver%.*}"

    # Generate mhwd database
    sh -e $srcdir/mhwd-nvidia \
    /usr/share/doc/nvidia/README \
    /usr/src/nvidia-$_version/nvidia/nv-kernel.o_binary \
    > $pkgdir/var/lib/mhwd/ids/pci/nvidia.ids

    install -Dm644 /usr/share/licenses/nvidia-dkms/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
