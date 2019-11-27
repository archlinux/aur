# $Id$
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: drakkan <nicola.murino@gmail.com>

pkgname=botan1.10
pkgver=1.10.17
pkgrel=1
pkgdesc='Crypto library written in C++ - old stable branch'
license=('BSD')
arch=('x86_64')
url='http://botan.randombit.net/'
depends=('gcc-libs' 'sh')
makedepends=('python2')
source=("https://botan.randombit.net/releases/old/Botan-${pkgver}.tgz"{,.asc})
sha512sums=('a47cab3af113652247c8efc8b0f043eb62175eaa8554833d5fc3016ea94dbdd8aa722ab9b5226cc5f133afbcc088d54362111630eaa4594812c39925cc3c8649'
            'SKIP')
validpgpkeys=('621DAF6411E1851C4CF9A2E16211EBF1EFBADFBC')  # Botan Distribution Key

build() {
  cd "Botan-$pkgver"

  python2 configure.py --prefix=/usr --enable-modules=cvc
  make
}

package() {
  cd "Botan-$pkgver"

  make DESTDIR="$pkgdir/usr" install
  find "$pkgdir/usr/share/doc" -type f -exec chmod 0644 {} \;
  install -Dm644 doc/license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
