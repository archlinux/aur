# Contributor: Filipe Bertelli <filipebertelli@tutanota.com>
# Maintainer: fossdd <fossdd@pwned.life>

_pkgbase=serve
pkgname=nodejs-$_pkgbase
pkgdesc='Quick HTTP server'
pkgver=14.2.3
pkgrel=3
arch=('any')
url='https://github.com/zeit/serve'
license=('MIT')
depends=('nodejs' 'xsel')
makedepends=('npm')
source=(http://registry.npmjs.org/$_pkgbase/-/$_pkgbase-$pkgver.tgz)
noextract=($_pkgbase-$pkgver.tgz)

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$_pkgbase-$pkgver.tgz
  rm -fr "$pkgdir"/usr/etc

  mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
  ln -s /usr/lib/node_modules/serve/license.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.md

  # Fix npm derp
  find "$pkgdir/usr" -type d -exec chmod 755 '{}' +

  # xsel is already in $depends
  rm -fr "$pkgdir"/usr/lib/node_modules/serve/node_modules/clipboardy/fallbacks
}

sha512sums=('56a505302ecadcb0c67869c933d879e83dd718a6fa28680ec3471536d036eb26171c2729c5fdf1c024d4690a169554bb8bc25d8771a3424381db7aac5f28e8c9')
