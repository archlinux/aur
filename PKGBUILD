# Maintainer: Cedric Girard <cgirard [dot] archlinux [at] valinor [dot] fr>
# Contributor: Mario Finelli <mario at finel dot li>

_npmname=clean-css
pkgname=nodejs-$_npmname
pkgver=5.3.3
pkgrel=1
pkgdesc="A fast, efficient, and well tested CSS minifier for node.js."
arch=('any')
url="https://github.com/jakubpawlowicz/clean-css"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('ff3ac576c8fc823fc250777ab31a06509a849e840b6341e1a972e1469bdc79a0')

package() {
  npm install -g --prefix "$pkgdir/usr" --cache "${srcdir}/npm-cache" "$srcdir"/$_npmname-$pkgver.tgz

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"

  install -Dm0644 "$pkgdir/usr/lib/node_modules/$_npmname/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
