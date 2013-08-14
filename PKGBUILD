# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=yourls-git
_gitname=YOURLS
pkgver=1.0.826.gb9844f1
pkgrel=1
pkgdesc="your own URL shortener"
arch=('any')
url="https://github.com/$_gitname/$_gitname"
license=('GPL3')
depends=('php>=4.3' 'mysql>=4.1')
makedepends=('subversion')
provides=('yourls')
conflicts=('yourls')
backup=('etc/webapps/yourls/config.php')
install=$pkgname.install
source=("git+https://github.com/$_gitname/${_gitname}.git")
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --always | sed 's|-|.|g'
}

package() {
  cd "$srcdir/$_gitname"
  mkdir -p "$pkgdir/usr/share/webapps/yourls" "$pkgdir/etc/webapps/yourls"

  cp -ra */ *.php "$pkgdir/usr/share/webapps/yourls"
  cp "sample-robots.txt" "$pkgdir/usr/share/webapps/yourls/robots.txt"
  mv "$pkgdir/usr/share/webapps/yourls/user/config-sample.php" \
     "$pkgdir/etc/webapps/yourls/config.php"
  ln -s "/etc/webapps/yourls/config.php" \
        "$pkgdir/usr/share/webapps/yourls/includes/config.php"
}

# vim:set ts=2 sw=2 et:
