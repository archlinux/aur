# Maintainer: MoetaYuko <loli at yuko dot moe>

_npmname=textlint-rule-preset-ja-spacing
pkgname=textlint-rule-ja-space-between-half-and-full-width
pkgver=2.2.0
pkgrel=2
pkgdesc="Textlint rules for half-wide and full-width spaces"
arch=('any')
url="https://github.com/textlint-ja/textlint-rule-preset-ja-spacing"
license=('MIT')
depends=('textlint')
makedepends=('npm')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=($_npmname-$pkgver.tgz)
sha512sums=('a3c6c2168379779ae70d5208c142d5206323b226eea49e52e09d6fb577572daafb4c6ec7b171ded9ffeb1f13f8800a72f9f042fd123a117ba2eb666de8f08667')

package() {
  npm install -g --prefix "$pkgdir"/usr "$srcdir"/$_npmname-$pkgver.tgz

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  chmod -R u=rwX,go=rX "$pkgdir"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"

  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s ../../../lib/node_modules/marked/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
