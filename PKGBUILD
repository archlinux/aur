# Maintainer: uwuclxdy <uwuclxdy@pm.me>

pkgname=zluda-preview-bin
pkgver=6.preview.73
pkgrel=1
pkgdesc='CUDA on AMD GPUs (pre-release ZLUDA binary).'
arch=('x86_64')
url='https://github.com/vosen/ZLUDA'
license=('Apache-2.0 OR MIT')
depends=('gcc-libs' 'glibc' 'hip-runtime-amd' 'hipblaslt' 'miopen-hip' 'rocblas' 'rocm-smi-lib')
provides=('zluda')
conflicts=('zluda' 'zluda-git' 'nvidia-utils')
options=(!strip !debug)

_tag=v6-preview.73
_commit=996bac54

source=(
    "zluda-linux-${_commit}.tar.gz::https://github.com/vosen/ZLUDA/releases/download/${_tag}/zluda-linux-${_commit}.tar.gz"
    "LICENSE-MIT::https://raw.githubusercontent.com/vosen/ZLUDA/${_tag}/LICENSE-MIT"
)
sha256sums=('c931bf88ac80503f89179b2a849d853f9aa3620bfead43b6131971f6c30529fd'
            '23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3')

package() {
    install -d -m755 "${pkgdir}/usr/lib"
    cp -dr --no-preserve=ownership zluda/lib*.so* zluda/zluda_ld "${pkgdir}/usr/lib/"

    install -dm755 "${pkgdir}/usr/lib/zluda"
    cp -dr --no-preserve=ownership zluda/trace zluda/trace_nvidia "${pkgdir}/usr/lib/zluda/"

    install -Dm755 zluda/zluda_ld         "${pkgdir}/usr/bin/zluda_ld"
    install -Dm755 zluda/ptxas            "${pkgdir}/usr/bin/ptxas"
    install -Dm755 zluda/zluda_precompile "${pkgdir}/usr/bin/zluda_precompile"

    install -Dm644 LICENSE-MIT -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
