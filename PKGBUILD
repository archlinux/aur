# Maintainer: George Sofianos <george at sofianos dot dev>

# Release notes https://github.com/Mesh-LLM/mesh-llm/releases/tag/v0.78.1
pkgname=mesh-llm-vulkan
pkgdesc="Mesh LLM lets you pool spare GPU capacity across machines and expose the result as one OpenAI-compatible API."
pkgver=0.78.1
_pkgver=0.78.1
pkgrel=1
arch=('x86_64')
url='https://github.com/Mesh-LLM/mesh-llm'
license=('Apache-2.0')
makedepends=('just' 'cmake' 'lld' 'pnpm' 'cargo' 'vulkan-headers' 'shaderc' 'spirv-headers' 'sccache')
depends=('vulkan-tools')
provides=('mesh-llm' 'mesh-llm-vulkan')
conflicts=('mesh-llm-cuda' 'mesh-llm-rocm')
options=('!debug' '!lto')

source=(
"${pkgname}-${pkgver}.tar.gz::https://github.com/Mesh-LLM/mesh-llm/archive/refs/tags/v${_pkgver}.tar.gz"
)

sha256sums=(
'b1fddc76910312b575910afe7433a64147cd677259706ebe27d8eaa87056b1cd'
)

build() {
  export RUSTUP_TOOLCHAIN=stable  
  cd $srcdir/mesh-llm-${_pkgver}
  just release-build-vulkan
}

package() {  
  cd $srcdir/mesh-llm-${_pkgver}
  install -Dm0755 target/release/mesh-llm "$pkgdir/usr/bin/mesh-llm"
  # install -Dm0755 target/debug/mesh-llm "$pkgdir/usr/bin/mesh-llm"
}
