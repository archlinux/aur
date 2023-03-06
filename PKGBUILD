# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>
# Co-maintainer: Carlos Galindo <arch -at- cgj.es>

pkgname=yourls
pkgver=1.9.2
pkgrel=1
pkgdesc="your own URL shortener"
arch=('any')
url="https://github.com/YOURLS/YOURLS"
license=('GPL3')
depends=('php>=7.4')
optdepends=('mysql>=5.0')
conflicts=('yourls-svn')
backup=('etc/webapps/yourls/config.php')
install=$pkgname.install
source=("yourls-${pkgver}.tar.gz::https://github.com/YOURLS/YOURLS/archive/${pkgver}.tar.gz")
sha512sums=('2762a671fa62ca05a4888f55045edff3117979ffd2f63634b42b2c30675135736df30469ae76454dc069399ed2cc9e815441289e0b0f9843c04c2f12fef6995d')

package() {
  cd "$srcdir/YOURLS-$pkgver"
  mkdir -p "$pkgdir/usr/share/webapps/yourls" "$pkgdir/etc/webapps/yourls"

  cp -ra */ *.php "$pkgdir/usr/share/webapps/yourls"
  cp "sample-robots.txt" "$pkgdir/usr/share/webapps/yourls/robots.txt"
  mv "$pkgdir/usr/share/webapps/yourls/user/config-sample.php" \
     "$pkgdir/etc/webapps/yourls/config.php"
  ln -s "/etc/webapps/yourls/config.php" \
        "$pkgdir/usr/share/webapps/yourls/includes/config.php"
}

# vim:set ts=2 sw=2 et:
