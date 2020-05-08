# Maintainer:  <me@sfxr.de>

_arch=$(uname -m)
pkgname=stack-static
pkgver=2.3.1
pkgrel=1
pkgdesc="The Haskell Tool Stack (linked statically)"
arch=('x86_64')
url="https://github.com/commercialhaskell/stack"
license=('custom:BSD3')
provides=( stack )
conflicts=( stack stack-bin haskell-stack )
replaces=( stack stack-bin haskell-stack )
depends=( gmp gcc-libs zlib ) # needed for working ghc downloaded by stack
optdepends=(
  'bash-completion'
  "ncurses5-compat-libs: using older ghc's linking against libtinfo.so.5"
)
source=(
  "stack.bash"
  "https://github.com/commercialhaskell/stack/releases/download/v${pkgver}/stack-${pkgver}-linux-x86_64-static.tar.gz"
  "https://github.com/commercialhaskell/stack/releases/download/v${pkgver}/stack-${pkgver}-linux-x86_64-static.tar.gz.asc"
)
sha256sums=('df46833a748574d01f38d4120e5021ee6fac9b8a70995674ca0bd2cacbd3e3c2'
            '4bae8830b2614dddf3638a6d1a7bbbc3a5a833d05b2128eae37467841ac30e47'
            'SKIP')
validpgpkeys=('2C6A674E85EE3FB896AFC9B965101FF31C5C154D')

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
