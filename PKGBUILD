# Maintainer: envolution
# Maintainer: Bastien "neitsab" Traverse <neitsab@archlinux.org>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=llama.cpp-vulkan-bin
pkgver=b6912
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
sha256sums=('822e99b75ec7fa104f157e51c20088fadbefbeb4ba79af3b5687cbbced2c8d4b'
            'f15a4d2a8f51e5cd1cee1e814a8239896a024495526984c6cd558ef6b31200b6')

package() {
  install -Dm755 build/bin/{llama,rpc}-* -t "${pkgdir}/usr/bin/"
  install -Dm755 build/bin/lib* -t "${pkgdir}/usr/lib/"

  install -Dm644 "build/bin/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/$pkgname/README.md"
}
# vim:set ts=2 sw=2 et:
