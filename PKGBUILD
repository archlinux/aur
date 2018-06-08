# Maintainer : Daniel Bermond < yahoo-com: danielbermond >

# NOTE:
# In order to build the package, you need to manually download the NCCL file
# from NVIDIA's website (registration required). Place the downloaded file
# in the PKGBUILD directory and run makepkg.
# Download website:
# https://developer.nvidia.com/nccl/

_srcver=2.2.13
_srcrel=1
_cudaver=9.2

pkgname=nccl
pkgver="${_srcver}.${_srcrel}"
pkgrel=1
pkgdesc='Library for NVIDIA Multi-GPU and multi-node collective communication primitives (needs registration at upstream URL and manual download)'
arch=('x86_64')
url='https://developer.nvidia.com/nccl/'
license=('custom')
depends=('cuda')
conflicts=('nccl-git')
options=('!strip')
source=("file://${pkgname}_${_srcver}-${_srcrel}+cuda${_cudaver}_x86_64.txz")
sha256sums=('2854bb5989dd5f06553bfd1367e718ce09b435f8758d0bd946b955fd41b6a93e')

package() {
    cd "${pkgname}_${_srcver}-${_srcrel}+cuda${_cudaver}_x86_64"
    
    # include
    install -D -m644 include/nccl.h "${pkgdir}/opt/cuda/include/nccl.h"
    
    # libraries
    mkdir -p       "${pkgdir}/opt/cuda/lib64"
    cp    -a lib/* "${pkgdir}/opt/cuda/lib64"
    
    # license
    install -D -m644 NCCL-SLA.txt          "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 COPYRIGHT.txt         "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
    sed     -i 's/NCCL-SLA\.txt/LICENSE/g' "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
}
