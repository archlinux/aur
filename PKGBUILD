# Maintainer: Mateusz Galazyn <carbolymer at gmail.com>

pkgname=haskell-language-server-static
pkgver=1.5.1
pkgrel=1
pkgdesc="Successor of ghcide & haskell-ide-engine. One IDE to rule them all."
arch=('x86_64')
url="https://github.com/haskell/${pkgname%-static}"
license=('Apache')
depends=()
provides=('haskell-language-server')
conflicts=('haskell-language-server' 'haskell-language-server-git')
source=()
sha256sums=('3618783bcbcdb0232dd671078ffc21f5164d38076c1bdea23c47c7ea3a4cc46c'
            'f121b94f2c2eaf37c0add3dd340bc7944979338c45deca738573482995a6a1ca'
            'b98c9220ee6e5c4f2ca1fa665053ecbafefb890429f32b5354c2823478d12398'
            '76b645b8f710d612d679a8858554f4a0fd0c1153fd05c0ddcde5fc60bb10db4f'
            '8c034d8a56dcee8b6507791e1e2878504f8f683458ad55a1557fa223a01007a9'
            '61e52e2a796f7a876cad07932e593ebd725dd0821656bd1536b9b657608c23a0'
            '0a1e128ee5f1a994798ad0e0af1490722810622045f3baa5749f99d7cf5b780c'
            '595eb1cb1e7670010048016a49e71ecb64dce6b398f214c72a4d762d28fdbd3f')
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
 
