# Maintainer: Jonatan Jonasson <notes@madeingotland.com>

pkgname=libggml-cuda-bin
_upstream_pkgname=ggml
pkgver=0.22.0
pkgrel=1
pkgdesc="Tensor library for machine learning with OpenBLAS, Vulkan, and CUDA"
arch=('x86_64')
url="https://github.com/OneNoted/libggml-cuda-bin"
license=('MIT')
depends=(
  'cuda'
  'nvidia-utils'
  'openblas'
  'spirv-headers'
  'vulkan-driver'
  'vulkan-icd-loader'
)
provides=(
  "${pkgname}=${pkgver}-${pkgrel}"
  "${pkgname}=0.10.0-1"
  "${pkgname}=0.9.11-2"
  "libggml=${pkgver}"
  "libggml-cuda-git=${pkgver}"
)
conflicts=(
  'libggml'
  'libggml-cuda-git'
)

# Metadata-only pkgrel bumps can reuse the previous binary asset.
_asset_pkgrel=1
_asset_name="${pkgname}-${pkgver}-${_asset_pkgrel}-x86_64.tar.zst"
source=(
  "${_asset_name}::${url}/releases/download/v${pkgver}-${_asset_pkgrel}/${_asset_name}"
)
sha256sums=('13c5f2d2b1c731bf1cc10d69ada9d29a0997b7106dc3ad7cecd7757561d575bc')

package() {
  bsdtar -xf "${srcdir}/${_asset_name}" -C "${pkgdir}"
}
