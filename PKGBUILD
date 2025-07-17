# Maintainer: Anirudh Konduru <anirudhmkonduru@gmail.com>

_npmname=@sourcegraph/amp
_npmver=0.0.1752710557-g42eb76 # renovate: datasource=npm depName=@sourcegraph/amp
_basename=amp
pkgname=sourcegraph-amp # All lowercase
pkgver=${_npmver//-/_}
pkgrel=1
pkgdesc="CLI for Amp, an agentic coding tool in research preview from Sourcegraph."
arch=(any)
url="https://ampcode.com/"
license=('custom')
depends=('nodejs')
makedepends=('npm')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_basename-$_npmver.tgz)
noextract=($_basename-$_npmver.tgz)
sha1sums=('7c1d0e82d1f72102fd345368a3844c31f64dd311')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" "$_npmname@$_npmver"

  # Remove references to build directories
  # https://wiki.archlinux.org/title/Node.js_package_guidelines#Package_contains_reference_to_$srcdir/$pkgdir
  find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

  chown -R root:root "$pkgdir"
}

# vim:set ts=2 sw=2 et:
