pkgname=neovim-lspconfig-git
pkgver=0.1.7.r158.g4bdd3800
pkgrel=1
pkgdesc="Quickstart configurations for the Neovim LSP client"
arch=('any')
url="https://github.com/neovim/nvim-lspconfig"
license=('Apache')

groups=(
  'neovim-plugins'
)

makedepends=(
  'git'
)

source=(
  "git+https://github.com/neovim/nvim-lspconfig.git"
)

sha512sums=(
  'SKIP'
)

pkgver() {
  cd nvim-lspconfig
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
  depends+=(
    'neovim'
  )

  cd nvim-lspconfig
  find lua plugin doc -type f -exec install -D -m644 '{}' "$pkgdir/usr/share/nvim/site/pack/dist/start/${pkgname}/{}" \;
  install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
