# Maintainer: Ivan Fonseca <ivanfon[at]riseup[dot]net>

# NPM package name
_npmname=fkill-cli
pkgname=fkill
pkgver=4.1.0
pkgrel=2
pkgdesc="Quickly kill processes from the command line."
arch=(any)
url="https://github.com/sindresorhus/fkill-cli"
license=(MIT)
depends=('nodejs')
makedepends=('npm')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('aa7a08cc6a883871ea9b40ce13b8d6a261f0c774ffcbdd37c47e2e5018876bad')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$_npmname-$pkgver.tgz

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  find "${pkgdir}"/usr -type d -exec chmod 755 {} +
}

# vim:set ts=2 sw=2 et:
