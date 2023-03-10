# Maintainer: Mario Finelli <mario at finel dot li>

_npmname=autoprefixer
pkgname=nodejs-$_npmname
pkgver=10.4.14
pkgrel=1
pkgdesc="Parse CSS and add vendor prefixes to rules by Can I Use"
arch=(any)
url=https://github.com/postcss/autoprefixer
license=(MIT)
depends=(nodejs)
makedepends=(npm)
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('2d6930f5e55470626ba16c48f85b8ee75775e5c426937225692be189d8857065')

package() {
  npm install --global \
    --cache "$srcdir/.npm-cache" \
    --prefix "$pkgdir/usr" \
    "$srcdir"/$_npmname-$pkgver.tgz

  find "$pkgdir/usr" -type d -exec chmod 755 '{}' +

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"

  install -Dm0644 "$pkgdir/usr/lib/node_modules/$_npmname/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set ts=2 sw=2 et:
