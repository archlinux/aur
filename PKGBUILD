# Maintainer: Bambang Catur Pamungkas <bambangcaturz@gmail.com>

_npmname='@sentry/cli'
pkgname=sentry-cli
pkgver=1.37.1
pkgrel=1
pkgdesc="A command line utility to work with Sentry"
arch=('i686' 'x86_64')
url="https://docs.sentry.io/cli/"
license=('BSD')
depends=('nodejs' 'npm')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('72d359529b7cb5132fd7167be26b0b6095331121084c615b7501c61f76038e40')

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
