# Contributor: Mike Redd <mredd -at- zerotuezero dot com>
pkgname=vim-easytree-git
pkgver=20140804
pkgrel=1.2
pkgdesc="easybuffer.vim - is a simple tree file manager for vim, highly inspired by NERDTree"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=4252"
license=('custom:vim')
depends=('vim' 'git')
makedepends=('git')
optdepends=()
groups=('vim-plugins')
install='vimdoc.install'
conflicts=('vim-easytree')
replaces=('vim-easytree')
provides=('vim-easytree')
source=("git+https://github.com/vim-scripts/easytree.vim.git")

md5sums=('SKIP')
sha256sums=('SKIP')

_gitroot="git://github.com/vim-scripts/easytree.vim.git"
_gitname="easytree.vim"

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
    # bash-vim-support plugin files:
    vim_share_dir="usr/share/vim/vimfiles"
    install -dm755 "$pkgdir/$vim_share_dir" || return 1
    cp -av "$srcdir/$_gitname/"{syntax,doc,plugin} \
        "$pkgdir/$vim_share_dir" || return 1

    # fix rights:)
    chmod -R a=r,u+w,a+X "$pkgdir/" || return 1
}

#$cat=editors
md5sums=()

# vim:syntax=sh
