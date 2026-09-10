# Maintainer: George Sofianos <george at sofianos dot dev>

# Release notes https://github.com/Mesh-LLM/mesh-llm/releases/tag/v0.76.0
pkgname=mesh-llm-rocm
pkgdesc="Mesh LLM lets you pool spare GPU capacity across machines and expose the result as one OpenAI-compatible API."
pkgver=0.76.0
_pkgver=0.76.0
pkgrel=2
arch=('x86_64')
url='https://github.com/Mesh-LLM/mesh-llm'
license=('Apache-2.0')
makedepends=('just' 'cmake' 'lld' 'pnpm' 'cargo')
depends=('rocm-hip-sdk' 'patchelf')
provides=('mesh-llm' 'mesh-llm-rocm')
conflicts=('mesh-llm-cuda' 'mesh-llm-vulkan')
options=('!lto')

source=(
"${pkgname}-${pkgver}.tar.gz::https://github.com/Mesh-LLM/mesh-llm/archive/refs/tags/v${_pkgver}.tar.gz"
)

sha256sums=(
'd4bcc6b8b68bc37e7ff99134e297a25c07a11f8a3e5d13cad3d4799cd09ddc61'
)

build() {
  # export ROCM_PATH=/opt/rocm/core
  # export HIP_PATH=/opt/rocm/core
  # export CMAKE_PREFIX_PATH=/opt/rocm/core
  export RUSTUP_TOOLCHAIN=stable
  cd $srcdir/mesh-llm-${_pkgver}
  just release-build-rocm
}

package() {  
  cd $srcdir/mesh-llm-${_pkgver}
  install -Dm0755 target/release/mesh-llm "$pkgdir/usr/bin/mesh-llm"
  # install -Dm0755 target/debug/mesh-llm "$pkgdir/usr/bin/mesh-llm"
}
