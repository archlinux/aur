# Maintainer: Rumato Estorsky <@rumatoest at x.com>
pkgname=llama-prism-cuda
pkgdesc="PrismML fork of llama.cpp with CUDA support to run Ternary Bonsai LLM models."
url="https://github.com/PrismML-Eng/llama.cpp"
pkgrel=1
arch=('x86_64')
license=('MIT')

pkgver="0.0.1_b10709_9a9394a"
_tag="prism-b10709-9a9394a"
_asset="llama-${_tag}-bin-linux-cuda-13.3-x64.tar.gz"
_source="${pkgname}_${_tag}"

depends=('glibc' 'libgcc' 'libstdc++' 'cuda')
conflicts=('llama-cpp' 'llama-cpp-git' 'ggml' 'ggml-cuda')
provides=('llama-cpp')

source=("${_source}.tar.gz::${url}/releases/download/${_tag}/${_asset}")
sha256sums=('7e01a434e513b373026c347cd008502ab04f6307d1cab71fcd4cea212b4fdbb0')

package() {
  cd "${srcdir}/llama-${_tag}"

  install -d "${pkgdir}/usr/lib"
  cp -a lib*.so* "${pkgdir}/usr/lib/"

  install -d "${pkgdir}/usr/bin"
  for f in *; do
    [[ $f == lib*.so* || $f == LICENSE || $f == *.tar.gz ]] && continue
    [[ -f $f ]] || continue
    install -Dm755 "$f" "${pkgdir}/usr/bin/$f"
  done

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
