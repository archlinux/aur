# Maintainer: lmartinez-mirror
# Contributor: Michael Herzberg <{firstname}@{firstinitial}{lastname}.de>
pkgname=vim-fzf-git
pkgver=r429.02a192e
pkgrel=1
pkgdesc='Vim plugin that integrates fzf, the fuzzy file finder'
arch=('any')
license=('MIT')
groups=('vim-plugins')
url='https://github.com/junegunn/fzf.vim'
depends=('vim-plugin-runtime' 'fzf')
optdepends=('bat: syntax-highlighted preview support'
            'git-delta: formatting git diff output with certain commands'
            'perl: Tags and Helptags support'
            'ripgrep: Rg command support'
            'the_silver_searcher: Ag command support')
makedepends=('git')
source=('git+https://github.com/junegunn/fzf.vim')
md5sums=('SKIP')

pkgver() {
  cd fzf.vim
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd fzf.vim
  install -Dm644  plugin/fzf.vim "${pkgdir}/usr/share/vim/vimfiles/plugin/fzf/fzf.vim"
  find autoload bin doc -type f -exec install -Dm644 '{}' \
    "$pkgdir/usr/share/vim/vimfiles/{}" \;
}
