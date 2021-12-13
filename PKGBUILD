# Maintainer: Cedric Girard <cgirard [dot] archlinux [at] valinor [dot] fr>

pkgname=nodejs-csso
_npmname=csso
pkgver=5.0.0
pkgrel=3
pkgdesc="CSS minifier with structural optimisations"
arch=('any')
url="https://github.com/css/csso"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
sha256sums=('5786f51f021300198086494a2a04aa4baf6126f0d39d3a749c28f293655fb893')

package() {
  npm install -g --prefix "$pkgdir"/usr --cache "${srcdir}/npm-cache" "$srcdir"/$_npmname-$pkgver.tgz

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"

  install -Dm0644 "$pkgdir/usr/lib/node_modules/$_npmname/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
