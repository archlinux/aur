# Maintainer: berberman <hatsue@typed.icu>

pkgname=haskell-language-server-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Integration point for ghcide and haskell-ide-engine. One IDE to rule them all."
arch=('x86_64')
url="https://github.com/haskell/${pkgname%-bin}"
license=('Apache')
depends=()
provides=('haskell-language-server')
conflicts=('haskell-language-server-git')
source=()
sha256sums=(
  '3207ab51e80ec2811c56091cfbdb1c99dce38e26b8bab054affa8fd59ec07be0'
  '6df122f307131b98b9c5e9ea3c389d658bb8814516ea77628f8611c0cfa18e33'
  '567a67e184d9b7be7d65604a958099c4c505221b9796ddbd5b6e6a9fff4e3318'
  '955cba33f2dadf212c3243e13a20849f51f8d4d66aa952ba420f13a7da3a6436'
  '93de83754fbfb85f8918fc099cc5c390e150b40973587148fb99f129d1e294b4'
  '103df9a883577a1f1f32644ddaf478c0abc950588964acf00da05a27c0547813'
  'd5f8142f88dd1203b6eabeb741bfbe34e8286d5fdb7f3db85d0f4e56235429ba')
_prefix="${pkgname%-bin}-Linux"
_ghc_versions=('8.6.4' '8.6.5' '8.8.2' '8.8.3' '8.8.4' '8.10.1')

for ver in ${_ghc_versions[@]}; do
  source+=("${_prefix}-${ver}.gz::${url}/releases/download/${pkgver}/${_prefix}-${ver}.gz")
done

# Wrapper is independent from ghc version
source+=("${pkgname%-bin}-wrapper-Linux.gz::${url}/releases/download/${pkgver}/${pkgname%-bin}-wrapper-Linux.gz")

package() {
  cd "${srcdir}"
  for ver in ${_ghc_versions[@]}; do
    install -Dm755 "${_prefix}-${ver}" "${pkgdir}/usr/bin/"${pkgname%-bin}-${ver}""
  done
  install -Dm755 "${pkgname%-bin}-wrapper-Linux" "${pkgdir}/usr/bin/${pkgname%-bin}-wrapper"
}
 
