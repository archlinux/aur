# Maintainer: Vain <aurmaint1 on host: uninformativ dot de>
pkgname=explain-git
pkgver=20121027
pkgrel=1
pkgdesc="Annotate commands using a simple markup language"
arch=('any')
url='http://www.uninformativ.de/projects/?q=explain'
license=('custom:PIZZA-WARE')
depends=('python2')
makedepends=('git')

_gitroot="git://github.com/vain/explain.git"
_gitname="master"

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
}

package() {
  cd "$srcdir/$_gitname-build"
  install -Dm755 explain.py "$pkgdir"/usr/bin/explain.py
  ln -s /usr/bin/explain.py "$pkgdir"/usr/bin/explain
  install -Dm644 man1/explain.py.1 "$pkgdir"/usr/share/man/man1/explain.py.1
  install -Dm644 man1/explain.1 "$pkgdir"/usr/share/man/man1/explain.1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
