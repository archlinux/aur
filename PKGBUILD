# Maintainer:  <simonfxr@gmail.com>
pkgname=stack-static
pkgver=1.7.1
pkgrel=1
pkgdesc="The Haskell Tool Stack (linked statically)"
arch=('x86_64')
curl="https://github.com/commercialhaskell/stack"
license=('custom:BSD3')
provides=( stack )
conflicts=( stack stack-bin haskell-stack )
replaces=( stack stack-bin haskell-stack )
depends=( gmp gcc-libs zlib ncurses5-compat-libs ) # needed for working ghc downloaded by stack
optdepends=( bash-completion )
source=(
    "stack.bash"
    "https://github.com/commercialhaskell/stack/releases/download/v${pkgver}/stack-${pkgver}-linux-x86_64.tar.gz"
    "https://github.com/commercialhaskell/stack/releases/download/v${pkgver}/stack-${pkgver}-linux-x86_64.tar.gz.asc"
)
sha256sums=('df46833a748574d01f38d4120e5021ee6fac9b8a70995674ca0bd2cacbd3e3c2'
            '647306bbf65dd0b555486e2a32776ba1cfe0c8f380e31c6aa93abd452cb209ee'
            'SKIP')
validpgpkeys=('C5705533DA4F78D8664B5DC0575159689BEFB442')

package() {
  cd "${srcdir}"
  local d="stack-${pkgver}-linux-x86_64"
  mkdir -p "${pkgdir}"/usr/{{bin,share/{doc,licenses}/"${pkgname}"},share/bash-completion/completions}
  cp "${d}/stack" "${pkgdir}/usr/bin"
  cp -R "${d}/doc/." "${pkgdir}/usr/share/doc/${pkgname}/"
  cp "${d}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"
  cp "stack.bash" "${pkgdir}/usr/share/bash-completion/completions/stack"
}

# vim:set ts=2 sw=2 et:
