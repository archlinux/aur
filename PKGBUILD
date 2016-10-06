# $Id$
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Micha Alt <micha.tucker at gmail dot com>

pkgname=gulp-cli
pkgver=1.2.2
pkgrel=1
pkgdesc='The streaming build system'
arch=('any')
url="http://gulpjs.com/"
license=('MIT')
depends=('nodejs' 'semver')
makedepends=('npm')
replaces=('gulp')
provides=('gulp')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=($pkgname-$pkgver.tgz)
md5sums=('663b2dde0bed198271c4e1d33babdd5a')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tgz
  rm -r "$pkgdir"/usr/etc

  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "../../../lib/node_modules/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"

  # Fix permissions
  find "$pkgdir/usr" -type d -exec chmod 755 '{}' +

  # Experimental dedup
  cd "$pkgdir"/usr/lib/node_modules/$pkgname/node_modules
  for dep in semver; do
    rm -r $dep;
    npm link $dep;
  done
}
