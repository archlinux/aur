# Maintainer:  <simonfxr@gmail.com>
pkgname=stack-static
pkgver=1.5.1
pkgrel=1
epoch=
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
    '6a250cbab60870f6b933c780c96c5cafb02d066a6f2d7182bb00ec005262842b'
    '317e12c63b19f4323a8387c157c1fc3d5cb0b062f90ed479c96a85ecb3a24dd8'
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
