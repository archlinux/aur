# Maintainer: Daniel Greve <greve.daniel.l@gmail.com>

pkgname=neovim-drop-in
pkgver=1
pkgrel=1
pkgdesc='Emulate vim and vi executables with neovim'
arch=('any')
url='https://neovim.io/doc/user/vim_diff.html'
license=('custom:none')
depends=('neovim')
optdepends=('xxd: For editing binary files')
provides=('vi' 'vim=7.0.4' 'vim-runtime')
conflicts=('gvim' 'neovim-symlinks' 'vi' 'vim')
source=('ex.sh' 'exim.sh' 'rview.sh' 'rvim.sh' 'view.sh' 'vimdiff.sh')
install=neovim-drop-in.install
md5sums=('43a308b1bd6ff01af18713cd396d9613'
         '7bfc8f55728827a9cfef456bc1b25e2c'
         '63df8ad2cf566c0b58c621e383f46e0f'
         'a970a2b303ea9f116eac6c91c045bd4c'
         '7e4047ace5a1f0793e707653f4dc0432'
	 '3e470ab2dc0a42e1ada96869e19ac094')

## To do: Provide vimtutor
package() {
  local _script
  for _script in "${source[@]}"; do
    install -Dm755 "${_script}" "${pkgdir}/usr/bin/${_script%.sh}"
  done

  local _link
  for _link in 'edit' 'vedit' 'vi' 'vim'; do
    ln -s 'nvim' "${pkgdir}/usr/bin/${_link}"
  done

  install -dm755 "${pkgdir}/usr/share/man/man1"
  local _man
  for _man in 'vi' 'vim' 'vimdiff'; do
    ln -s 'nvim.1.gz' "${pkgdir}/usr/share/man/man1/${_man}.1.gz"
  done
}
