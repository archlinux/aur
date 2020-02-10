# Maintainer:
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Marco Pompili <aur (at) emarcs (dot) org>
# Contributor: Daniel Nagy <danielnagy at gmx de>

_npmname=node-inspector
pkgname=nodejs-$_npmname
pkgver=1.1.2
pkgrel=2
pkgdesc="Web Inspector based nodeJS debugger"
arch=('any')
url="https://github.com/$_npmname/$_npmname/"
license=('BSD')
depends=('nodejs-lts-dubnium')
makedepends=('npm' 'node-gyp')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=("$_npmname-$pkgver".tgz)
sha256sums=('969f309a0148bb9546999e7b45d474a4e5fd3715967a982e7e776022aca3577f')
noextract=("${source[@]##*/}")

package() {
  npm install -g --user root --cache "${srcdir}/npm-cache" --prefix "$pkgdir/usr" "${source[@]##*/}"
  find "${pkgdir}"/usr -type d -exec chmod 755 {} +
  find "${pkgdir}" -type f -name package.json -exec sed -i -e "/${pkgdir//\//\\/}/d" -e "/${srcdir//\//\\/}/d" {} \;
  chown -R root:root $pkgdir
  rm -r "$pkgdir"/usr/etc
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "../../../lib/node_modules/$_npmname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et:
