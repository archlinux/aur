# Maintainer: Bastien "neitsab" Traverse <neitsab@archlinux.org>

pkgname=llama.cpp-vulkan-bin
pkgver=b6663
pkgrel=1
pkgdesc="LLM inference in C/C++ (with Vulkan GPU optimizations) (precompiled Linux binaries)"
arch=("x86_64")
url="https://github.com/ggerganov/llama.cpp"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-git" "${pkgname/-vulkan/}" "${pkgname/-vulkan-bin/}")
depends=(curl gcc-libs)
source=("${pkgname%-bin}-${pkgver}.zip"::"${url}/releases/download/${pkgver}/llama-${pkgver}-bin-ubuntu-vulkan-x64.zip"
        "README-${pkgver}.md::https://raw.githubusercontent.com/ggml-org/llama.cpp/${pkgver}/README.md")
sha256sums=('59380605418f475d82a49271d46b6ce37fbf4e1227c11242b97f3dd826230df0'
            'e59cd4d5cf94fffbe3c8df0883956c2cdfe0652dda46eb41fc49413ee4da694e')

package() {
  install -Dm755 build/bin/{llama,rpc}-* -t "${pkgdir}/usr/bin/"
  install -Dm755 build/bin/lib* -t "${pkgdir}/usr/lib/"

  install -Dm644 "build/bin/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/$pkgname/README.md"
}
