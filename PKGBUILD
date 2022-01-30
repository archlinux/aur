# Maintainer: Mateusz Galazyn <carbolymer at gmail.com>

pkgname=haskell-language-server-static
pkgver=1.6.1.0
pkgrel=1
pkgdesc="Successor of ghcide & haskell-ide-engine. One IDE to rule them all."
arch=('x86_64')
url="https://github.com/haskell/${pkgname%-static}"
license=('Apache')
depends=()
provides=('haskell-language-server')
conflicts=('haskell-language-server' 'haskell-language-server-git')
source=()
sha256sums=('ab64962983aa5240cbf8c152d1b86ee72a3be0fcd467c85c0c91b52992788b52'
            '32507ced518aa0fe861ad7e9521ef6df7b26e1ae574fbf6499246f45bb092ccf'
            '3b90983710cb3723a62dad037b8672808ef9283d77948131b2f3ad956a7022b5'
            'cdd1562df23e42605d929cf969dcaf1b8890be1094e83004a757d7d226313235'
            '840a5d9a1a34109224005bd9a3369be032cd4c2180ae92015de160f986eb4569'
            'd70a4b4bcca607855e259e20481c1016f69225fb97f217018e20a070fa937d45'
            '46ddbff4a0fe6b529deee174eed4fe32d8d7457e81de527681d7bc5dc9b26a17'
            'e002fa80ff3c6d5645b4c3c316d894acbb2ccee21ade5dcb807fd7f7e258e292')
_prefix="${pkgname%-static}-Linux"
_ghc_versions=('8.6.5' '8.8.4' '8.10.6' '8.10.7' '9.0.1' '9.0.2' '9.2.1')

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
 
