pkgname=neovim-cmp-nvim-lsp-git
pkgver=r37.5af77f5
pkgrel=1
pkgdesc="neovim-cmp source for Neovim's builtin LSP client"
arch=('any')
url="https://github.com/hrsh7th/cmp-nvim-lsp"
license=('MIT')

groups=(
  'neovim-plugins'
)

makedepends=(
  'git'
)

source=(
  "git+https://github.com/hrsh7th/cmp-nvim-lsp.git"
)

sha512sums=(
  'SKIP'
)

pkgver() {
  cd cmp-nvim-lsp
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  depends+=(
    'neovim'
  )

  cd cmp-nvim-lsp
  find after lua doc -type f -exec install -D -m644 '{}' "$pkgdir/usr/share/nvim/site/pack/dist/start/${pkgname}/{}" \;
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
