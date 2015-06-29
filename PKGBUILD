# Maintainer: sumito3478 <sumito3478@gmail.com>
# Contributor: sumito3478 <sumito3478@gmail.com>
pkgname=git-now-git
pkgver=20131020
pkgrel=1
pkgdesc="A temporary commit tool for git"
arch=('any')
url="https://github.com/iwata/git-now"
license=('GPL')
makedepends=('git')
depends=('git')

_gitroot=https://github.com/iwata/git-now.git
_gitname=git-now

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull --ff origin
    msg "The local files are updated."
  else
    git clone --recursive "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
}

package() {
  cd "$srcdir/$_gitname"
  make prefix="$pkgdir/usr" install
  git reset --hard HEAD
}

# vim:set ts=2 sw=2 et:
