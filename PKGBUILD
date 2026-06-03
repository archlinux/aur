# Maintainer: George Sofianos <george at sofianos dot dev>

# Release notes https://github.com/Mesh-LLM/mesh-llm/releases/tag/v0.72.0-rc1
pkgname=mesh-llm-cuda
pkgdesc="Mesh LLM lets you pool spare GPU capacity across machines and expose the result as one OpenAI-compatible API."
pkgver=0.72.0rc1
_pkgver=0.72.0-rc1
pkgrel=1
arch=('x86_64')
url='https://github.com/Mesh-LLM/mesh-llm'
license=('Apache-2.0')
makedepends=('just' 'cmake' 'npm' 'cargo')
depends=('cuda')
provides=('mesh-llm' 'mesh-llm-cuda')
conflicts=('mesh-llm-rocm' 'mesh-llm-vulkan')
options=('!lto')

source=(
"${pkgname}-${pkgver}.tar.gz::https://github.com/Mesh-LLM/mesh-llm/archive/refs/tags/v${_pkgver}.tar.gz"
)

sha256sums=(
'b446e62a222e2cd40b5bda10249a7884a2b40081ac243a31c1c2770a3c005cdf'
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
