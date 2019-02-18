# Maintainer: Ivan Fonseca <ivanfon[at]riseup[dot]net>
# Contributor: John D Jones III jnbek1972 __AT__ $mailservice_by_google __DOT__ com

_npmname=tldr
_npmver=3.2.7
pkgname=nodejs-tldr # All lowercase
pkgver=3.2.7
pkgrel=1
pkgdesc="Simplified and community-driven man pages"
arch=(any)
url="https://github.com/tldr-pages/tldr"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=('262d4f695632b02b77b787a0991af85a8f3cab6e601c5c8295ad3556275fd9fd')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$_npmname-$_npmver.tgz

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  find "${pkgdir}"/usr -type d -exec chmod 755 {} +
}

# vim:set ts=2 sw=2 et:
