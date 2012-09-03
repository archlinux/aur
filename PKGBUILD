# Maintainer: Frederik "Freso" S. Olesen <freso.dk@gmail.com>
_gitname=aov-html2epub
_gitroot=https://github.com/angelortega/aov-html2epub.git
pkgname=$_gitname-git
pkgver=20120903
pkgrel=1
pkgdesc='Minimal HTML to EPUB format converter.'
arch=(any)
url='https://github.com/angelortega/aov-html2epub'
license=('public domain')
depends=('bash')
makedepends=('git')
provides=($_gitname)

build() {
  cd "$srcdir"
  msg 'Connecting to GIT server....'

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg 'The local files are updated.'
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg 'GIT checkout done or server timeout'
  msg 'Starting build...'

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
}

package() {
  cd "$srcdir/$_gitname-build"
  install -d "$pkgdir/usr/bin"
  make PREFIX="$pkgdir/usr/bin" install
  install -d "$pkgdir/usr/share/doc/$pkgname"
  install -t "$pkgdir/usr/share/doc/$pkgname" README
}

# vim:set ts=2 sw=2 et:
