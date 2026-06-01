# Maintainer: George Sofianos <george at sofianos dot dev>

# Release notes https://github.com/Mesh-LLM/mesh-llm/releases/tag/v0.71.0
pkgname=mesh-llm-rocm
pkgdesc="Mesh LLM lets you pool spare GPU capacity across machines and expose the result as one OpenAI-compatible API."
pkgver=0.71.0
_pkgver=0.71.0
pkgrel=1
arch=('x86_64')
url='https://github.com/Mesh-LLM/mesh-llm'
license=('Apache-2.0')
makedepends=('just' 'cmake' 'npm' 'cargo')
depends=('rocm-hip-sdk')
provides=('mesh-llm' 'mesh-llm-rocm')
conflicts=('mesh-llm-cuda' 'mesh-llm-vulkan')
options=('!lto')

source=(
"${pkgname}-${pkgver}.tar.gz::https://github.com/Mesh-LLM/mesh-llm/archive/refs/tags/v${_pkgver}.tar.gz"
)

sha256sums=(
'4e8cedbe314ccfece208e37e00626b62b2cc2d2d9fb5c2415f22c8f381a909fa'
)

build() {
  export RUSTUP_TOOLCHAIN=stable  
  cd $srcdir/mesh-llm-${_pkgver}
  just build rocm
}

package() {  
  cd $srcdir/mesh-llm-${_pkgver}
  #install -Dm0755 target/release/mesh-llm "$pkgdir/usr/bin/mesh-llm"
  install -Dm0755 target/debug/mesh-llm "$pkgdir/usr/bin/mesh-llm"
}
