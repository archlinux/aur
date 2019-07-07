# Maintainer: David Peter <mail@david-peter.de>
_npmname=insect
_npmver=5.2.0
pkgname=insect
pkgver=5.2.0
pkgrel=2
pkgdesc="High precision scientific calculator with support for physical units"
arch=(any)
url="https://github.com/sharkdp/insect"
license=('MIT')
depends=('nodejs' 'npm' )
optdepends=()
makedepends=('nodejs-pulp' 'bower' 'purescript-bin' )
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(b1a44a2cf68b8adb52ef628f584a663fda4e2796)

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
