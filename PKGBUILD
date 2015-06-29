# Contributor: sumito3478 <sumito3478@gmail.com>
pkgname=vim-scala-git
pkgver=20150130
pkgrel=2
pkgdesc="Vim support files for the Scala programming language, from the official Scala Github repository"
arch=('any')
url="https://github.com/scala/scala-tool-support/tree/master/tool-support/vim"
license=('unknown')
depends=('vim-runtime')
makedepends=('git')
provides=('vim-scala-svn')
conflicts=('vim-scala-svn')

_gitroot="https://github.com/scala/scala-tool-support.git"
_gitname=scala-dist

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
}

package() {
  cd "$srcdir/$_gitname"
  cd "tool-support/vim"
  install -d -m755 "${pkgdir}/usr/share/vim/vimfiles"
  cp -r ftdetect indent plugin syntax "${pkgdir}/usr/share/vim/vimfiles" || return 1
  install -D -m644 README "${pkgdir}/usr/share/doc/${pkgname}/README" || return 1
}

# vim:set ts=2 sw=2 et:
