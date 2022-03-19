# Maintainer: Mario Finelli <mario at finel dot li>

_npmname=autoprefixer
pkgname=nodejs-$_npmname
pkgver=10.4.4
pkgrel=1
pkgdesc="Parse CSS and add vendor prefixes to rules by Can I Use"
arch=(any)
url=https://github.com/postcss/autoprefixer
license=(MIT)
depends=(nodejs)
makedepends=(npm)
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('d24a7013586d7a6851ffde70bb1d91bda26684821812a5aceb3f6de84195250a')

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
