# Contributor: Mike Redd <mredd -at- zerotuezero dot com>
pkgname=vim-bash-support-git
pkgver=20140804
pkgrel=1.3
pkgdesc="BASH IDE -- Write and run BASH-scripts using menus and hotkeys."
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=365"
license=('custom:vim')
depends=('vim' 'git' 'bash')
makedepends=('git')
optdepends=('bashdb')
install='vimdoc.install'
conflicts=('vim-bash-support')
replaces=('vim-bash-support')
provides=('vim-bash-support')
source=("git+https://github.com/vim-scripts/bash-support.vim.git")

md5sums=('SKIP')
sha256sums=('SKIP')

_gitroot="git://github.com/vim-scripts/bash-support.vim.git"
_gitname="bash-support.vim"

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
    cp -av "$srcdir/$_gitname/"{bash-support,doc,plugin} \
        "$pkgdir/$vim_share_dir" || return 1

    # fix rights:)
    chmod -R a=r,u+w,a+X "$pkgdir/" || return 1
}

#$cat=editors
md5sums=()

# vim:syntax=sh
