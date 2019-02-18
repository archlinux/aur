# Maintainer: Ivan Fonseca <ivanfon@riseup.net>

# NPM package name
_npmname=fkill-cli

pkgname=fkill
pkgver=5.2.0
pkgrel=1
pkgdesc="Fabulously kill processes. Cross-platform."
arch=(any)
url="https://github.com/sindresorhus/fkill-cli"
license=(MIT)
depends=('nodejs')
makedepends=('npm')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
sha256sums=('4344452db902bfc79117d3ed7bee3cf6c243986e24e85e11b8da5e04ecf0c849')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$_npmname-$pkgver.tgz

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  find "${pkgdir}"/usr -type d -exec chmod 755 {} +
}

# vim:set ts=2 sw=2 et:

