# Maintainer: Terje Larsen <terlar@gmail.com>
pkgname=oni
pkgver=0.1.11
pkgrel=1
pkgdesc='NeoVim front-end UI focused on IDE-like extensibility'
arch=(any)
url="https://www.npmjs.com/package/$pkgname"
license=('MIT')
depends=('nodejs' 'neovim')
makedepends=('npm')
source=("http://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
sha256sums=('b094d2e238d5f63981ea4747c4ed906a4cbf87140fd561c4ce0191c13cad19db')
noextract=("$pkgname-$pkgver.tgz")

build() {
  target="$srcdir/oni"
  npm install -g --user root --prefix "$target/usr" "$srcdir/$pkgname-$pkgver.tgz"
  rm -rf "$target/usr/etc"
  find "$target/usr/lib/node_modules/oni" \
      -name "package.json" -exec sed -i -e "s|$srcdir||g" '{}' +
}

package() {
  cp -r $srcdir/oni/* "$pkgdir"
}

# vim:set ts=2 sw=2 et:
