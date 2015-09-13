# Maintainer: nrio <nrio@mailbox.org>
pkgname=vim-elixir-git
pkgver=r211.f2c747d
pkgrel=1
pkgdesc="Vim configuration files for Elixir"
arch=('any')
url="https://github.com/elixir-lang/vim-elixir"
license=('Apache')
makedepends=('git')
optdepends=('vim-matchit: Use % to jump between "do" and "end"')
source=('git+https://github.com/elixir-lang/vim-elixir.git'
        'manifest.txt')
sha256sums=('SKIP'
'77928ee91ea696f23888d086a543cfc9a0e6f619fd3b5a3d5f4d017c5f8fa888')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  local vimfiles="${pkgdir}/usr/share/vim/vimfiles"
  install -Dm644 compiler/exunit.vim "${vimfiles}/compiler/exunit.vim"
  install -Dm644 ftdetect/elixir.vim "${vimfiles}//ftdetect/elixir.vim"
  install -Dm644 ftdetect/eelixir.vim "${vimfiles}/ftdetect/eelixir.vim"
  install -Dm644 ftplugin/elixir.vim "${vimfiles}//ftplugin/elixir.vim"
  install -Dm644 ftplugin/eelixir.vim "${vimfiles}/ftplugin/eelixir.vim"
  install -Dm644 indent/elixir.vim "${vimfiles}//indent/elixir.vim"
  install -Dm644 indent/eelixir.vim "${vimfiles}/indent/eelixir.vim"
  install -Dm644 syntax/elixir.vim "${vimfiles}//syntax/elixir.vim"
  install -Dm644 syntax/eelixir.vim "${vimfiles}/syntax/eelixir.vim"

  if ! find . \( -path ./.git -o -path ./spec \) -prune -o -print | sort | cmp -s "${srcdir}/manifest.txt"
  then
    msg "WARNING: Some files have been added or removed in the git repository."
    msg "Package may need updating."
  fi
}
