# Maintainer: Pieter Goetschalckx

pkgname=yuglify
pkgver=2.0.0
pkgrel=1
pkgdesc="A wrapper around UglifyJS and cssmin with the default YUI configurations"
arch=(any)
url=https://github.com/yui/yuglify
license=(custom)
depends=(nodejs)
makedepends=(npm)
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
sha256sums=('c5380f86738acb9a83b600104a36d23c2d7c8e4f69fa642acf7c0e517d82be81')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tgz
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "../../../lib/node_modules/yuglify/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"

	# Non-deterministic race in npm gives 777 permissions to random directories.
	# See https://github.com/npm/npm/issues/9359 for details.
	find "${pkgdir}/usr" -type d -exec chmod 755 {} +

	# npm gives ownership of ALL FILES to build user
	# https://bugs.archlinux.org/task/63396
	chown -R root:root "${pkgdir}"
}
