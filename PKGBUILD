_npmnamespace=@simon04
_npmname=npm2arch
pkgname=nodejs-npm2arch
pkgver=2.1.0
pkgrel=1
pkgdesc="Convert NPM package to a PKGBUILD for ArchLinux"
arch=(any)
url="https://github.com/simon04/npm2arch"
license=(MIT)
depends=('nodejs' 'npm')
optdepends=()
source=(https://registry.npmjs.org/$_npmnamespace/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha1sums=('4504704732a79b7fb0a77425488b2ed7d99ad44e')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmnamespace/$_npmname@$pkgver
  find "${pkgdir}"/usr -name package.json -exec sed -i '/"_where"/d' '{}' '+'
  find "${pkgdir}"/usr -type d -exec chmod 755 {} +
}

# vim:set ts=2 sw=2 et:
