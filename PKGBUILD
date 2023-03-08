# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='offpunk-git'
_pkgname='offpunk'
pkgver=1.9.r1.g1333d1b
pkgrel=1
epoch=2
pkgdesc='Fork of the command-line Gemini client AV-98 with added offline capabilities'
arch=('any')
#url='https://notabug.org/ploum/offpunk/'
url='https://git.sr.ht/~lioploum/offpunk'
license=('BSD')
depends=(
  'python'
  'file'
  'less'
)
makedepends=(
  'coreutils'
  'git'
  'python-setuptools'
)
optdepends=(
  'chafa: chafa and ansiwrap are required to render images in terminal'
  'python-beautifulsoup4: conversion of HTML'
  'python-cryptography: better support of TOFU client certificates'
  'python-feedparser: required to parse RSS and Atom feeds'
  'python-pillow: image manipulation'
  'python-readability-lxml: conversion of HTML'
  'python-requests: for HTTP support'
  'python-setproctitle: allows offpunk to change its process title'
  'timg: view images and videos in the terminal'
  'xdg-utils: xdg-open opens a URL in the preferred application'
  'xsel: copies text to and from the clipboard'
)
provides=('offpunk')
conflicts=(
  'offpunk'
  'av-98-offline'
)
source=("git+$url")
noextract=("$_pkgname")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname" || exit 1

  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

package() {
  cd "$_pkgname" || exit 1

  umask 0022
  python setup.py install --root="$pkgdir" --prefix='/usr' --optimize=1

  test -f man/offpunk.1 && \
  install -Dm0644 man/offpunk.1 "$pkgdir/usr/share/man/man1/offpunk.1"
  install -Dm0644 README.md     "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 LICENSE       "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# eof
