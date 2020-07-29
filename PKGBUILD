# Maintainer: berberman <hatsue@typed.icu>

pkgname=haskell-language-server-bin
pkgver=0.2.2
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
  'b9a5a2e78d935d052a46ce536c4ca28fea07b976fa1e434f8448fbe4e858d72e'
  '5a060c616c5ee24446186c014c9f279b831b5c370b78fd3678bfdb839144250d'
  'e993b94a7216098ae67b47e270228e058b5212e5f25730eb104c1113882c5433'
  'e8c47fdde73557cf555d8b2c007121710c9494ad86038d0b5672ce0a67937a9d'
  'a91453965a6bcf1e9467c0843e12a34eace132e7949b5302480fb0eb88115719'
  'f2de625fcd483d69fc9377222228b767189d9e07a2e1ec8c4ff1d73855c51877')
_prefix="${pkgname%-bin}-Linux"
_ghc_versions=('8.6.4' '8.6.5' '8.8.3' '8.8.4' '8.10.1')

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
 
