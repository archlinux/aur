# Maintainer: mutantmonkey <mutantmonkey@mutantmonkey.in>
pkgname=python2-sha3-git
pkgver=20121201
pkgrel=1
pkgdesc="A Python module that implements SHA-3 (Keccak) with a hashlib-like interface"
arch=('i686' 'x86_64')
url="https://github.com/bjornedstrom/python-sha3"
license=('PSF')
depends=('python2')
makedepends=('git' 'gcc')
provides=('python2-sha3')
conflicts=('python2-sha3')
options=(!emptydirs)

_gitroot=https://github.com/bjornedstrom/python-sha3.git
_gitname=python-sha3

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

  python2 setup.py build
}

package() {
  cd "$srcdir/$_gitname-build"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
