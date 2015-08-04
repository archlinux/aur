# Contributor: muhas <muhas@mail.ru>
pkgname=fbless
pkgver=0.2.2
pkgrel=1
pkgdesc="fictionbook console viewer"
url="http://pybookreader.narod.ru/misc.html"
license="GPL"
depends=('python2' 'ncurses')
makedepends=('git')
arch=('any')
source=()
md5sums=()

_gitdir="fbless"
_giturl="https://github.com/matimatik/fbless.git"
_gitbranch="master"
_commit="baa99b59a429af7bb3de877ac11df82fb7d46935"

build() {
  # Change into source directory
  cd "${srcdir}"

  # Clone or pull from GIT server, and notify user of the status
  msg "Connecting to GIT server...."
  if [[ -d $_gitdir ]] ; then
    cd "$_gitdir" && git pull origin "$_gitbranch"
    msg "The local files are updated."
  else
    git clone "$_giturl" "$_gitdir"
    cd "$_gitdir"
  fi
  git checkout "$_commit"
}

package() {
  cd "$srcdir/$_gitdir"
  python2 setup.py install --root=$pkgdir 
}


