# Maintainer: lmartinez-mirror
# Contributor: Michael Herzberg <{firstname}@{firstinitial}{lastname}.de>
pkgname=vim-fzf-git
pkgver=r433.ee91c93
pkgrel=2
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
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url" 'LICENSE')
sha256sums=('SKIP'
            '595e5c7670f76137827109954edd66d57ff85ce6f79a7548ea5dd588a4e22f7f')

pkgver() {
  cd fzf.vim
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd fzf.vim
  install -Dm 644  plugin/fzf.vim "$pkgdir/usr/share/vim/vimfiles/plugin/fzf/fzf.vim"
  find bin -type f -exec install -Dm 755 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  find autoload doc -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dm 444 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
