# Maintainer: George Sofianos <george at sofianos dot dev>

# Release notes https://github.com/Mesh-LLM/mesh-llm/releases/tag/v0.78.1
pkgname=mesh-llm
pkgdesc="Mesh LLM lets you pool spare GPU capacity across machines and expose the result as one OpenAI-compatible API."
pkgver=0.78.1
_pkgver=0.78.1
pkgrel=1
arch=('x86_64')
url='https://github.com/Mesh-LLM/mesh-llm'
license=('Apache-2.0')
makedepends=('just' 'cmake' 'lld' 'pnpm' 'cargo' 'sccache')
depends=('patchelf')
provides=('mesh-llm')
conflicts=('mesh-llm-rocm' 'mesh-llm-cuda' 'mesh-llm-vulkan')
options=('!debug' '!lto')

source=(
"${pkgname}-${pkgver}.tar.gz::https://github.com/Mesh-LLM/mesh-llm/archive/refs/tags/v${_pkgver}.tar.gz"
)

sha256sums=(
'f357109751e0fb67294c8e76dfdd5d7932a79a939dda9f7780b6046079a041ad'
)

build() {
  export RUSTUP_TOOLCHAIN=stable
  cd $srcdir/mesh-llm-${_pkgver}
  just build
}

package() {  
  cd $srcdir/mesh-llm-${_pkgver}
  install -Dm0755 target/debug/mesh-llm "$pkgdir/usr/bin/mesh-llm"
}
