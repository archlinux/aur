# Maintainer: KFERMercer <https://github.com/KFERMercer>

# shellcheck disable=2034,2148,2154

pkgname=nvidia-pstated
pkgver=1.0.9
pkgrel=1
pkgdesc='A daemon that automatically manages the performance states of NVIDIA GPUs'
arch=('x86_64')
url='https://github.com/sasha0552/nvidia-pstated'
license=('GPL-3.0-only')

depends=('nvidia-utils')

makedepends=(cmake
             cuda)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sasha0552/nvidia-pstated/archive/refs/tags/v${pkgver}.tar.gz"
        nvidia-pstated.service)

sha256sums=('6c566f93baeed37db6e042f8516a574ec28e4744936fa9876f2e87648bad7aea'
            'a10ea6fccb64b0b598d6d8fd680ff21c0163d7abb36cc39cf7bbe4f6028a6891')

build() {
    cmake -B build -S "${pkgname}-${pkgver}" -DCMAKE_BUILD_TYPE=None 
    cmake --build build
}

package() {
    install -Dm755 build/nvidia-pstated "${pkgdir}/usr/bin/nvidia-pstated"
    install -Dm644 "${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 nvidia-pstated.service "${pkgdir}/usr/lib/systemd/system/nvidia-pstated.service"
}
