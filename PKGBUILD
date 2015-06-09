# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=('vim-opa-git')
pkgver=20121125
pkgrel=1
pkgdesc="A set of Opa plug-ins for VIM"
arch=('any')
url="https://github.com/MLstate/opalang/"
license=('GPL')
groups=('vim-plugins')
depends=('vim')
install=vimdoc.install

_gitroot=http://github.com/MLstate/opalang.git
_gitname=opalang

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
  # nothing
}

package() {  
  cd "$srcdir/$_gitname-build/tools/editors/vim"
  install -d "$pkgdir/usr/share/vim/vimfiles"
  find . -type d -exec cp -R --preserve=mode \{\} "$pkgdir/usr/share/vim/vimfiles" \;
}

# vim:set ts=2 sw=2 et:
