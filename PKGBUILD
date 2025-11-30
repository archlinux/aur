# Maintainer: envolution
# Maintainer: Bastien "neitsab" Traverse <neitsab@archlinux.org>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=llama.cpp-vulkan-bin
pkgver=b7200
pkgrel=1
pkgdesc="LLM inference in C/C++ (with Vulkan GPU optimizations) (precompiled Linux binaries)"
arch=("x86_64")
url="https://github.com/ggerganov/llama.cpp"
license=('MIT')
provides=("llama.cpp" libggml ggml)
conflicts=("llama.cpp" libggml ggml)
depends=(curl gcc-libs vulkan-icd-loader)
source=("${pkgname%-bin}-${pkgver}.zip"::"${url}/releases/download/${pkgver}/llama-${pkgver}-bin-ubuntu-vulkan-x64.zip"
  "README-${pkgver}.md::https://raw.githubusercontent.com/ggml-org/llama.cpp/${pkgver}/README.md")
sha256sums=('ac2614fdae1203026239ea4ee0fc71f80e0126dae8b22fd0f4ea3bf7f42f916a'
            'a859b5008203c4500111149bc0ebd5d98db09ea129316327399c9fc89ef081bf')

package() {
  install -Dm755 build/bin/{llama,rpc}-* -t "${pkgdir}/usr/bin/"
  install -Dm755 build/bin/lib* -t "${pkgdir}/usr/lib/"

  install -Dm644 "build/bin/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/$pkgname/README.md"
}
# vim:set ts=2 sw=2 et:
