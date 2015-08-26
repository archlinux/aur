# Maintainer: Michael Kopp <kopp.michael@yahoo.de>
pkgname=pdfminer-git
pkgver=20130409
pkgrel=1
pkgdesc="python utils to extract& analyze text data of PDF files."
arch=('i686' 'x86_64')
url="http://www.unixuser.org/~euske/python/pdfminer/"
license=('MIT/X')
depends=('python2')
makedepends=('git' 'python2')
conflicts=('pdfminer')
provides=('pdfminer')

_gitroot="git://github.com/euske/pdfminer.git"
_gitname="pdfminer"

build() {
  msg "Connecting to GIT server...."

  if [[ -d $_gitname ]] ; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"

  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
}

package() {
  msg "Starting make..."

  cd "$srcdir/$_gitname-build"
  python2 setup.py install --home=$pkgdir/usr
  mv $pkgdir/usr/lib/python $pkgdir/usr/lib/python2.7

  # todo: do this only when option 'doc' is set
  msg "Copying documentation..."
  cp -r docs $pkgdir/usr/share/doc/pdfminer
}

# vim: ft=sh syn=sh et
