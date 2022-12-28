# Maintainer: David Peter <mail@david-peter.de>
_npmname=insect
_npmver=5.8.0
pkgname=insect
pkgver=5.8.0
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
sha1sums=(519d459949d2b93290ab765c11a7596a7b4e2b70)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" "$srcdir"/$_npmname-$_npmver.tgz

  # see https://wiki.archlinux.org/index.php/Node.js_package_guidelines
  find "${pkgdir}"/usr -type d -exec chmod 755 {} +
  find "${pkgdir}" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

  chown -R root:root "${pkgdir}"
}

# vim:set ts=2 sw=2 et:
