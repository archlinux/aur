# Maintainer: Mateusz Galazyn <carbolymer at gmail.com>

pkgname=haskell-language-server-static
pkgver=1.4.0
pkgrel=1
pkgdesc="Successor of ghcide & haskell-ide-engine. One IDE to rule them all."
arch=('x86_64')
url="https://github.com/haskell/${pkgname%-static}"
license=('Apache')
depends=()
provides=('haskell-language-server')
conflicts=('haskell-language-server' 'haskell-language-server-git')
source=()
sha256sums=('6fdea95ac096b904d42f664c3bb04a9ecf2e31790bf2c2e1bb8bc83391109809'
            '9d8cb0e80ecec73fc1b5bfa33b6dadce0911aff2149fa2d9955b9a15c8708e6e'
            '6b209a74128558335efefe36c37655575bd5f361862441b9548e49e56158052d'
            '2aa74d4b9742466b559f50d6a56533113403b1eb10b80253944ae8757b4c5c48'
            '23b27e7ed5b0d483c84cdfeb145adfa58d4c96179c6901a09dc554596ca8be88'
            'ab56d0a153d7ab7014004f46bf906e232ca5a66481bfd4afbce4229a61527652'
            '132c37e79bb47d1577901cad56a3473ed3974d30329171d1fa181cf05e7f723b'
            '43fcc00758783888690181de2a703712afd07ed241c9341d8967036512d3f790'
            '690f4594bd127d0174403ab3b167d1f4c1d54d19e4a0e02e4ff4fdf3bd6d9339'
            'fc36239db64328f3157595656cfad3a62dcf8aec550046acb07c6e12e6902264'
            'd3bc7177f3caea60ce3c1d73180bbdc84bf549518fc4b68648e6773fe1741d1b'
            'f29736098fee79cce5a72432410994fdf1a4b80af048e12d4652e02cf86d5560')
_prefix="${pkgname%-static}-Linux"
_ghc_versions=('8.6.4' '8.6.5' '8.8.3' '8.8.4' '8.10.2' '8.10.3' '8.10.4' '8.10.5' '8.10.6' '8.10.7' '9.0.1')

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
 
