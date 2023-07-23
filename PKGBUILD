# Maintainer: David Peter <mail@david-peter.de>
_npmname=insect
_npmver=5.9.0
pkgname=insect
pkgver=5.9.0
pkgrel=3
pkgdesc="High precision scientific calculator with support for physical units"
arch=(any)
url="https://github.com/sharkdp/insect"
license=('MIT')
depends=('nodejs' )
optdepends=()
makedepends=('npm' )
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(f7a5fc884e32d44ace322cc4cac91edc2eefdac5)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" "$srcdir"/$_npmname-$_npmver.tgz

  # see https://wiki.archlinux.org/index.php/Node.js_package_guidelines
  find "${pkgdir}"/usr -type d -exec chmod 755 {} +
  find "${pkgdir}" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

  install -Dm644 "$_npmdir/insect/insect.desktop" "${pkgdir}/usr/share/applications/insect.desktop"
  install -Dm644 "$_npmdir/insect/web/media/insect.svg" "${pkgdir}/usr/share/pixmaps/insect.svg"

  chown -R root:root "${pkgdir}"
}

# vim:set ts=2 sw=2 et:
