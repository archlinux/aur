# Maintainer: George Sofianos <george at sofianos dot dev>

# Release notes https://github.com/Mesh-LLM/mesh-llm/releases/tag/v0.75.0
pkgname=mesh-llm-cuda
pkgdesc="Mesh LLM lets you pool spare GPU capacity across machines and expose the result as one OpenAI-compatible API."
pkgver=0.75.0
_pkgver=0.75.0
pkgrel=1
arch=('x86_64')
url='https://github.com/Mesh-LLM/mesh-llm'
license=('Apache-2.0')
makedepends=('just' 'cmake' 'lld' 'pnpm' 'cargo')
depends=('cuda')
provides=('mesh-llm' 'mesh-llm-cuda')
conflicts=('mesh-llm-rocm' 'mesh-llm-vulkan')
options=('!lto')

source=(
"${pkgname}-${pkgver}.tar.gz::https://github.com/Mesh-LLM/mesh-llm/archive/refs/tags/v${_pkgver}.tar.gz"
)

sha256sums=(
'cc07b13daa8cb70827d33f20486745814ec65c9be132a741833a27f82ca358c4'
)

build() {
  export RUSTUP_TOOLCHAIN=stable  
  cd $srcdir/mesh-llm-${_pkgver}
  just build cuda  
}

package() {  
  cd $srcdir/mesh-llm-${_pkgver}
  # install -Dm0755 target/release/mesh-llm "$pkgdir/usr/bin/mesh-llm"
  install -Dm0755 target/debug/mesh-llm "$pkgdir/usr/bin/mesh-llm"
}
