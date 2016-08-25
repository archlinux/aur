# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=stikked-git
_gitname='Stikked'
pkgver=0.10.0.r34.ge068019
pkgrel=2
pkgdesc="An advanced and beautiful pastebin written in PHP"
arch=('any')
url="https://github.com/claudehohl/Stikked"
license=('GPL')
depends=('php')
makedepends=('git')
provides=('stikked')
conflicts=('stikked')
backup=('etc/webapps/stikked/stikked.php')
install=$pkgname.install
source=('git+https://github.com/claudehohl/Stikked.git'
        'https://patch-diff.githubusercontent.com/raw/claudehohl/Stikked/pull/370.patch')
sha1sums=('SKIP'
          '934fd0331238b9f2c3a008069faafd6628685822')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_gitname"
  patch -p1 -i "$srcdir/370.patch"
}

package() {
  cd "$srcdir/$_gitname/htdocs"

  mkdir -p "$pkgdir/usr/share/webapps/Stikked" "$pkgdir/etc/webapps/stikked"
  cp -ra * .htaccess "$pkgdir/usr/share/webapps/Stikked"
  mv "$pkgdir/usr/share/webapps/Stikked/application/config/stikked.php.dist" \
     "$pkgdir/etc/webapps/stikked/stikked.php"
  ln -s "/etc/webapps/stikked/stikked.php" \
        "$pkgdir/usr/share/webapps/Stikked/application/config/stikked.php"
}

# vim:set ts=2 sw=2 et:
