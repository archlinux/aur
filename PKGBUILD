pkgname=neovim-luasnip-git
pkgver=2.2.0.r25.ga7a4b46
pkgrel=1
pkgdesc="Snippet engine for Neovim"
arch=('any')
url="https://github.com/L3MON4D3/LuaSnip"
license=('Apache')

groups=(
  'neovim-plugins'
)

makedepends=(
  'git'
)

source=(
  "git+https://github.com/L3MON4D3/LuaSnip.git"
)

sha512sums=(
  'SKIP'
)

pkgver() {
  cd LuaSnip
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
  depends+=(
    'neovim'
  )

  cd LuaSnip
  find doc ftplugin lua plugin syntax -type f -exec install -D -m644 '{}' "$pkgdir/usr/share/nvim/site/pack/dist/start/${pkgname}/{}" \;
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
