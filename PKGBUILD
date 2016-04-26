# Maintainer: nrio <nrio@mailbox.org>
pkgname=vim-elixir-git
pkgver=r251.fe61852
pkgrel=1
pkgdesc="Vim configuration files for Elixir"
arch=('any')
url="https://github.com/elixir-lang/vim-elixir"
license=('Apache')
makedepends=('git')
install=${pkgname}.install
source=('git+https://github.com/elixir-lang/vim-elixir.git'
        'manifest.txt'
        'vim-elixir-git.install')
sha256sums=('SKIP'
            'f912b234fdd331da79d7953e237fbb22aefcaded65c6a10f1345c4ad34d1185c'
            '8541cd602af3eb0350d80328a9cda051b7f7f1675446c8f083605514afbc1e91'
)

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  local vimfiles="${pkgdir}/usr/share/vim/vimfiles"

  if ! find . \( -path ./.git -o -path ./spec \) -prune -o -print | sort | cmp -s "${srcdir}/manifest.txt"
  then
    msg "WARNING: Some files have been added or removed in the git repository."
    msg "Package may need updating."
  fi

  install -Dm644 compiler/exunit.vim "${vimfiles}/compiler/exunit.vim"
  install -Dm644 ftdetect/elixir.vim "${vimfiles}//ftdetect/elixir.vim"
  install -Dm644 ftplugin/elixir.vim "${vimfiles}//ftplugin/elixir.vim"
  install -Dm644 ftplugin/eelixir.vim "${vimfiles}/ftplugin/eelixir.vim"
  install -Dm644 indent/elixir.vim "${vimfiles}//indent/elixir.vim"
  install -Dm644 indent/eelixir.vim "${vimfiles}/indent/eelixir.vim"
  install -Dm644 syntax/elixir.vim "${vimfiles}//syntax/elixir.vim"
  install -Dm644 syntax/eelixir.vim "${vimfiles}/syntax/eelixir.vim"
}
