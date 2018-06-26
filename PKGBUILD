# Maintainer: Fabio Zanini <fabio.zanini _at_ tuebingen.mpg.de>
pkgname=vim-biosyntax-git
pkgver=1518543961
pkgrel=1
pkgdesc="Syntax Highlighting for Computational Biology, vim plugin"
arch=('any')
license=('GPL3')
groups=()
depends=('vim')
makedepends=('git')

source=("biosyntax-vim::git+https://github.com/bioSyntax/bioSyntax-vim.git" "vim-biosyntax.install")
md5sums=('SKIP' 'db2324de860f43a5b639d6ec9f1f87bf')

pkgver() {
  cd "$srcdir/biosyntax-vim"
  git log -n1 --pretty=format:%ct
}

build() {
  # Dark background: comment the following line if you prefer the original white background
  sed -i 's/normal\tcterm=NONE\tguibg=NONE\tguifg=NONE\tctermbg=NONE/normal\tcterm=NONE\tguibg=\#111111\tguifg=NONE\tctermbg=0/' "$srcdir/biosyntax-vim/colors/bioSyntax.vim"
}

package() {
  cd "$srcdir/biosyntax-vim"
  install -dm755 "$pkgdir/usr/share/vim/vimfiles"
  find * -maxdepth 0 -type d -exec cp -R -t "$pkgdir/usr/share/vim/vimfiles" '{}' \+
}

