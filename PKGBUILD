pkgname=neovim-cmp-buffer-git
pkgver=r53.3022dbc
pkgrel=1
pkgdesc="neovim-cmp source for buffer words"
arch=('any')
url="https://github.com/hrsh7th/cmp-buffer"
license=('MIT')

groups=(
  'neovim-plugins'
)

makedepends=(
  'git'
)

source=(
  "git+https://github.com/hrsh7th/cmp-buffer.git"
)

sha512sums=(
  'SKIP'
)

pkgver() {
  cd cmp-buffer
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  depends+=(
    'neovim'
  )

  cd cmp-buffer
  find after lua -type f -exec install -D -m644 '{}' "$pkgdir/usr/share/nvim/site/pack/dist/start/${pkgname}/{}" \;
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
