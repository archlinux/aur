# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# Contributor: Anna Vyalkova <cyber AT sysrq DOT in>
# -*- sh -*-

pkgname='offpunk-git'
_pkgname='offpunk'
pkgver=2.1.r0.g1bbd317
pkgrel=1
epoch=3
pkgdesc='Fork of the command-line Gemini client AV-98 with added offline capabilities (development snapshot)'
arch=('any')
url='https://git.sr.ht/~lioploum/offpunk'
license=('AGPL')
depends=(
  'python'
  'file'
  'less'
)
makedepends=(
  'coreutils'
  'git'
  'python-build'
  'python-hatchling'
  'python-installer'
  'python-wheel'
)
optdepends=(
  'chafa: chafa and ansiwrap are required to render images in terminal'
  'python-beautifulsoup4: conversion of HTML'
  'python-chardet: detect text encoding'
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
  cd "$_pkgname"

  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

build() {
  cd "$_pkgname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  test -f man/offpunk.1 && \
  install -vDm0644 man/offpunk.1 "$pkgdir/usr/share/man/man1/offpunk.1"
  install -vDm0644 README.md     "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# eof
