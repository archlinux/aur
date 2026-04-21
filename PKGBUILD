# Maintainer: envolution
# Contributor: Bastien "neitsab" Traverse <neitsab@archlinux.org>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=llama.cpp-bin
pkgver=b8870
pkgrel=1
pkgdesc="LLM inference in C/C++ (precompiled Linux binaries)"
arch=("x86_64")
url="https://github.com/ggerganov/llama.cpp"
license=('MIT')
provides=("llama.cpp" libggml ggml)
conflicts=("llama.cpp" libggml ggml)
depends=(curl gcc-libs)
source=("${pkgname%-bin}-${pkgver}.tar.gz"::"${url}/releases/download/${pkgver}/llama-${pkgver}-bin-ubuntu-x64.tar.gz"
  "https://raw.githubusercontent.com/ggml-org/llama.cpp/${pkgver}/README.md")
sha256sums=('3264b2327426ef5151bf21f739c1688a096f7729b8dc3de744a9b045f5ed8f5f'
            '8a1669ef62973155774ab679f0ee71905a98e6f830956cb8e56c8ed491378bed')

package() {
  cd "$srcdir/llama-${pkgver}"
  install -Dm755 {llama,rpc-}* -t "${pkgdir}/usr/bin/"
  install -d "${pkgdir}/usr/lib/"
  cp -d lib* "${pkgdir}/usr/lib/"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/README.md" "${pkgdir}/usr/share/doc/$pkgname/README.md"
}
# vim:set ts=2 sw=2 et:
