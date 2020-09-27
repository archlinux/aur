# Maintainer: David Peter <mail@david-peter.de>
_npmname=insect
_npmver=5.5.0
pkgname=insect
pkgver=5.5.0
pkgrel=1
pkgdesc="High precision scientific calculator with support for physical units"
arch=(any)
url="https://github.com/sharkdp/insect"
license=('MIT')
depends=('nodejs' 'npm' )
optdepends=()
makedepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(396e97017d32a415da442a809a51ed2d82db462a)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --user root --prefix "$pkgdir/usr" "$srcdir"/$_npmname-$_npmver.tgz

  # see https://wiki.archlinux.org/index.php/Node.js_package_guidelines
  find "${pkgdir}"/usr -type d -exec chmod 755 {} +
  find "${pkgdir}" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
}

# vim:set ts=2 sw=2 et:
