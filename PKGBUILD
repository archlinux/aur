# Maintainer: George Sofianos <george at sofianos dot dev>

# Release notes https://github.com/Mesh-LLM/mesh-llm/releases/tag/v0.72.0-rc3
pkgname=mesh-llm-rocm
pkgdesc="Mesh LLM lets you pool spare GPU capacity across machines and expose the result as one OpenAI-compatible API."
pkgver=0.72.0rc3
_pkgver=0.72.0-rc3
pkgrel=1
arch=('x86_64')
url='https://github.com/Mesh-LLM/mesh-llm'
license=('Apache-2.0')
makedepends=('just' 'cmake' 'lld' 'pnpm' 'cargo')
depends=('rocm-hip-sdk')
provides=('mesh-llm' 'mesh-llm-rocm')
conflicts=('mesh-llm-cuda' 'mesh-llm-vulkan')
options=('!lto')

source=(
"${pkgname}-${pkgver}.tar.gz::https://github.com/Mesh-LLM/mesh-llm/archive/refs/tags/v${_pkgver}.tar.gz"
)

sha256sums=(
'6ff418bcdeca4f08becf530124b7a8421fc56b23145f06e9a51ed85e895bea6d'
)

build() {
  export RUSTUP_TOOLCHAIN=stable  
  cd $srcdir/mesh-llm-${_pkgver}
  just build rocm
}

package() {  
  cd $srcdir/mesh-llm-${_pkgver}
  # install -Dm0755 target/release/mesh-llm "$pkgdir/usr/bin/mesh-llm"
  install -Dm0755 target/debug/mesh-llm "$pkgdir/usr/bin/mesh-llm"
}
