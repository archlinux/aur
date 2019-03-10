# Maintainer: Bambang Catur Pamungkas <bambangcaturz@gmail.com>

_npmname='@sentry/cli'
pkgname=sentry-cli
pkgver=1.40.0
pkgrel=1
pkgdesc="A command line utility to work with Sentry"
arch=('i686' 'x86_64')
url="https://docs.sentry.io/cli/"
license=('BSD')
depends=('nodejs' 'npm')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('287d0fc08b871c88dcbf43e87d9a87c615c3d9c6907fbb5c091a642ffefc7e53')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
  # remove reference to $pkgdir
  # see: https://github.com/npm/npm/issues/10393
  find . -name "package.json" -type f | xargs sed -i -e '/_where/d'
}

# vim:set ts=2 sw=2 et:
