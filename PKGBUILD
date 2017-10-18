# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: lolilolicon <lolilolicon_at_gmail_dot_com>

pkgname=vim-camelcasemotion
pkgver=1.52
pkgrel=1
pkgdesc='Vim plugin for motions by camelcase or underscores.'
arch=('any')
url='http://www.vim.org/scripts/script.php?script_id=1905'
license=('none')
depends=('vim>=7.3')
groups=('vim-plugins')
install=vimdoc.install
source=("${pkgname}.vba.gz::http://www.vim.org/scripts/download_script.php?src_id=16854")
sha256sums=('cab8338793fbe6642c1eb2e570a4e0078a97e509a5c00534d40d7ac1b92e23c8')
noextract=("${pkgname}.vba.gz")

prepare() {
    gunzip -f "${pkgname}.vba.gz"
    vim "${pkgname}.vba" -c "UseVimball ${srcdir}" -c "q"
}

package() {
  cd "${srcdir}"
  local _vimdir="$pkgdir/usr/share/vim/vimfiles"
  install -D -m644 {,"$_vimdir/"}"autoload/${pkgname#vim-}.vim"
  install -D -m644 {,"$_vimdir/"}"doc/${pkgname#vim-}.txt"
  install -D -m644 {,"$_vimdir/"}"plugin/${pkgname#vim-}.vim"
}
