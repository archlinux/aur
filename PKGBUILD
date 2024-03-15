pkgname=neovim-lint-git
pkgver=r362.03b1fc5
pkgrel=1
pkgdesc="Asynchronous linter plugin"
arch=('any')
url="https://github.com/mfussenegger/nvim-lint"
license=('GPL')

groups=(
  'neovim-plugins'
)

makedepends=(
  'git'
)

source=(
  "git+https://github.com/mfussenegger/nvim-lint.git"
)

sha512sums=(
  'SKIP'
)

pkgver() {
  cd nvim-lint
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  depends+=(
    'neovim'
  )

  cd nvim-lint
  find lua -type f -exec install -D -m644 '{}' "$pkgdir/usr/share/nvim/site/pack/dist/start/${pkgname}/{}" \;
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
