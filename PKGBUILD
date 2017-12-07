# Maintainer:  <simonfxr@gmail.com>
pkgname=stack-static
pkgver=1.6.1
pkgrel=1
pkgdesc="The Haskell Tool Stack (linked statically)"
arch=('x86_64')
curl="https://github.com/commercialhaskell/stack"
license=('custom:BSD3')
provides=( stack )
conflicts=( stack haskell-stack )
replaces=( stack haskell-stack )
depends=( ncurses5-compat-libs ) # needed for working ghc downloaded by stack
optdepends=( bash-completion )
source=(
    "stack.bash"
    "https://github.com/commercialhaskell/stack/releases/download/v${pkgver}/stack-${pkgver}-linux-x86_64-static.tar.gz"
    "https://github.com/commercialhaskell/stack/releases/download/v${pkgver}/stack-${pkgver}-linux-x86_64-static.tar.gz.asc"
)
sha256sums=(
  'df46833a748574d01f38d4120e5021ee6fac9b8a70995674ca0bd2cacbd3e3c2'
  '5f7ad6f2934561beb296d472f77034033c38a89a2ec2aeba78edcbb0034af80e'
  '5b47f386e12f35176e84fa3f888a499014411b7f21df222cbdc7354eaae84507'
)
validpgpkeys=('C5705533DA4F78D8664B5DC0575159689BEFB442')

package() {
  cd "${srcdir}"

  local d="stack-${pkgver}-linux-x86_64-static"
  mkdir -p "${pkgdir}"/usr/{{bin,share/{doc,licenses}/"${pkgname}"},share/bash-completion/completions}
  cp "${d}/stack" "${pkgdir}/usr/bin"
  cp -R "${d}/doc/." "${pkgdir}/usr/share/doc/${pkgname}/"
  cp "${d}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"
  cp "stack.bash" "${pkgdir}/usr/share/bash-completion/completions/stack"
}

# vim:set ts=2 sw=2 et:
