_major=12
_minor=2
_patch=2
_release=1

pkgname=cuda-$_major.$_minor
pkgver=$_major.$_minor.$_patch
pkgrel=$_release

pkgdesc="NVIDIA's GPU programming toolkit (Last CUDA version for 535 driver)"
arch=('x86_64')
url="https://developer.nvidia.com/cuda-zone"
license=('custom:NVIDIA')
replaces=('cuda-toolkit' 'cuda-sdk' 'cuda-static')
provides=("cuda=${pkgver}" 'cuda-toolkit' 'cuda-sdk')
conflicts=('cuda')
depends=('gcc12' "opencl-nvidia-535xx" "nvidia-535xx-utils")
optdepends=('gdb: for cuda-gdb'
            'glu: required for some profiling tools in CUPTI')
makedepends=('zstd' 'tar')
options=(!strip staticlibs)
install=cuda.install

_archive_basename=cuda-$_major.$_minor.$_patch-$_release-$arch.pkg.tar
_archlinux_archive="https://archive.archlinux.org/packages/c/cuda"

source=("$_archlinux_archive/$_archive_basename.zst")
sha256sums=("95ec5134e03042c71de670738f82143b8185d6fbd4993086374b855bc299dbb8")

prepare() {
    rm .BUILDINFO
    rm .INSTALL
    rm .MTREE
    rm .PKGINFO
}

package() {
    cp -rp ${srcdir}/etc ${pkgdir}/
    cp -rp ${srcdir}/opt ${pkgdir}/
    cp -rp ${srcdir}/usr ${pkgdir}/
}
