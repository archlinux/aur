pkgname=neovim-cmp-git
pkgdesc="Autocompletion plugin for Neovim"
pkgver=0.0.2.r24.gd97d85e
pkgrel=1
arch=('any')
url="https://github.com/hrsh7th/nvim-cmp"
license=('MIT')

conflicts=(
  'neovim-cmp'
)

provides=(
  'neovim-cmp'
)

groups=(
  'neovim-plugins'
)

makedepends=(
  'git'
)

source=(
  "git+https://github.com/hrsh7th/nvim-cmp.git"
)

sha512sums=(
  'SKIP'
)

pkgver() {
  cd nvim-cmp
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
  depends+=(
    'neovim'
  )

  cd nvim-cmp
  find autoload doc lua plugin -type f -exec install -D -m644 '{}' "$pkgdir/usr/share/nvim/site/pack/dist/start/${pkgname}/{}" \;
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
