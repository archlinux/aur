# Maintainer: Caleb Maclennan <caleb@alerque.com>

_npmname=pandiff
pkgname=nodejs-"$_npmname"
pkgver=0.5.0
pkgrel=2
pkgdesc='Prose diffs for any document format supported by Pandoc'
arch=('any')
url="https://github.com/davidar/$_npmname"
license=('MIT')
depends=('nodejs' 'pandoc')
makedepends=('npm')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=("${source[@]##*/}")
sha256sums=('2ca38a951203aabdea1b198289e531562c7ee5ca00eda9e42012a4bf10a4978c')

package() {
  npm install -g --user root --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "${source[@]##*/}"
  find "$pkgdir"/usr -type d -exec chmod 755 {} +
  find "$pkgdir" -type f -name package.json -exec sed -i -e "/${pkgdir//\//\\/}/d" -e "/${srcdir//\//\\/}/d" {} \;
  chown -R root:root "$pkgdir"
}

# vim:set ts=2 sw=2 et:
