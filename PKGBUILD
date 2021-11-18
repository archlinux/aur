# Maintainer: Mateusz Galazyn <carbolymer at gmail.com>

pkgname=haskell-language-server-static
pkgver=1.5.0
pkgrel=1
pkgdesc="Successor of ghcide & haskell-ide-engine. One IDE to rule them all."
arch=('x86_64')
url="https://github.com/haskell/${pkgname%-static}"
license=('Apache')
depends=()
provides=('haskell-language-server')
conflicts=('haskell-language-server' 'haskell-language-server-git')
source=()
sha256sums=('a9c5a9831dda14d7832e98e184d1d7f19474218c5dee8621e679e77cb485319e'
            '5b172a0581619d774eebb1035351af69770d0c94d78cd42afceb361aa11c3182'
            '1bafb38483cb7be49b6839b1572644a820fb248ba597914b21789f35bcd94225'
            '7b9fc595ef8709a51c83f80b0d89246c95e96052610f59a214d6e88f6b5536b8'
            '89adabc2c4756d3bd25283f6fb227ec30b5cdb853c8a22f51f3771ea0739529c'
            '585d163654518648d99500cf28c5e39ca0e21aab5a275b1d3c6880c34f518638'
            'aff2b4f7716494324ee9ee180088dce2c0c03ad3cf934910146624e34881b6a7'
            '2876ac5f12d5c31be82167567b51a6d67c4a1dc510ae99394ad6c776c2705acb')
_prefix="${pkgname%-static}-Linux"
_ghc_versions=('8.6.5' '8.8.3' '8.8.4' '8.10.5' '8.10.6' '8.10.7' '9.0.1')

for ver in ${_ghc_versions[@]}; do
  source+=("${_prefix}-${ver}-${pkgver}.gz::${url}/releases/download/${pkgver}/${_prefix}-${ver}.gz")
done

# Wrapper is independent from ghc version
source+=("${pkgname%-static}-wrapper-Linux-${pkgver}.gz::${url}/releases/download/${pkgver}/${pkgname%-static}-wrapper-Linux.gz")

package() {
  cd "${srcdir}"
  for ver in ${_ghc_versions[@]}; do
    install -Dm755 "${_prefix}-${ver}-${pkgver}" "${pkgdir}/usr/bin/"${pkgname%-static}-${ver}""
  done
  install -Dm755 "${pkgname%-static}-wrapper-Linux-${pkgver}" "${pkgdir}/usr/bin/${pkgname%-static}-wrapper"
}
 
