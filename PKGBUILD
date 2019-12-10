# Maintainer: Jonathan Neidel <aur at jneidel dot com>
# PKGBUILD adapted from: https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=fkill

_npmname=tslide

pkgname=nodejs-tslide
pkgver=1.5.0
pkgrel=1
pkgdesc="Terminal SlideDeck, supporting markdown."
arch=(any)
url="https://github.com/dominictarr/tslide"
license=(MIT)
depends=('nodejs')
makedepends=('npm')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('f2e719a44d1c9efc7e257393fa53248f780e9373e6363d4575b4e8c4ba353179')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$_npmname-$pkgver.tgz

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  find "${pkgdir}"/usr -type d -exec chmod 755 {} +
}

# vim:set ts=2 sw=2 et:
