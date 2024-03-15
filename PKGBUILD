pkgname=neovim-cmp-git
pkgver=0.0.1.r161.g04e0ca3
pkgrel=1
pkgdesc="Autocompletion plugin for Neovim"
arch=('any')
url="https://github.com/hrsh7th/nvim-cmp"
license=('MIT')

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
