# Contributor: Mike Redd <mredd -at- zerotuezero dot com>
pkgname=vim-bettersearch-git
_pkgname=betterSearch.vim
pkgver=20140804
pkgrel=1.2
pkgdesc="Provide better search functionality by capturing all matched line"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=4241"
license=('custom:vim')
depends=('vim' 'git')
makedepends=('git')
optdepends=()
groups=('vim-plugins')
install='vimdoc.install'
conflicts=('vim-bettersearch')
replaces=('vim-bettersearch')
provides=('vim-bettersearch')
source=("git+https://github.com/vim-scripts/betterSearch.vim.git")

md5sums=('SKIP')
sha256sums=('SKIP')

_gitroot="https://github.com/vim-scripts/betterSearch.vim.git"
_gitname="betterSearch.vim"

build() {
  cd $srcdir

  # checkout
  if [ -d ${srcdir}/$_gitname ] ; then
    cd $_gitname && git pull origin
  else
    git clone --depth 1 $_gitroot $_gitname && cd $_gitname
  fi
}

package() {
  cd $srcdir/$_gitname
    # betterSearch plugin file:
    vim_share_dir="usr/share/vim/vimfiles"
    install -dm755 "$pkgdir/$vim_share_dir" || return 1
    # remove git cruft
    rm -rf "$srcdir/"$_pkgname/.git/
    cp -a "$srcdir/"$_pkgname \
        "$pkgdir/$vim_share_dir" || return 1

    # fix rights:)
    chmod -R a=r,u+w,a+X "$pkgdir/" || return 1
}

#$cat=editors
md5sums=()

# vim:syntax=sh
