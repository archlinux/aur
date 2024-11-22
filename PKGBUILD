# Contributor: Filipe Bertelli <filipebertelli@tutanota.com>
# Maintainer: fossdd <fossdd@pwned.life>

_pkgbase=serve
pkgname=nodejs-$_pkgbase
pkgdesc='Quick HTTP server'
pkgver=14.2.4
pkgrel=1
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

sha512sums=('ab2d52df83c9fdf718f208d51accc307711788f4a4e452a151aeed41ed143d175dc5189d73657a70d1cf35ec1b1350fb3009202ee584b77570e7abd8cbbdedcd')
