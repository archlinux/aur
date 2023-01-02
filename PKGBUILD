# $Id$
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: drakkan <nicola.murino@gmail.com>

pkgname=botan1.10
pkgver=1.10.17
pkgrel=3
pkgdesc='Obsolete branch of the Botan crypto library for Monotone'
license=('BSD')
arch=('x86_64')
url='http://botan.randombit.net/'
depends=('gcc-libs' 'sh')
makedepends=('python')
source=("https://botan.randombit.net/releases/old/Botan-${pkgver}.tgz"{,.asc}
        "sphinx-python3.diff")
sha512sums=('a47cab3af113652247c8efc8b0f043eb62175eaa8554833d5fc3016ea94dbdd8aa722ab9b5226cc5f133afbcc088d54362111630eaa4594812c39925cc3c8649'
            'SKIP'
            '18cdf4f3739adb853e1b9a743ef79caad899fcd074bd70e4bb689716a8ee46768667ddc74912ed8849474ffd45c10f5399b0dc8f330a9b9851c24cce3a228937')
validpgpkeys=('621DAF6411E1851C4CF9A2E16211EBF1EFBADFBC')  # Botan Distribution Key

prepare() {
  cd "Botan-$pkgver"

  patch -Np1 < "$srcdir/sphinx-python3.diff"
}

build() {
  cd "Botan-$pkgver"

  python configure.py --prefix=/usr --enable-modules=cvc
  make
}

package() {
  cd "Botan-$pkgver"

  make DESTDIR="$pkgdir/usr" install
  find "$pkgdir/usr/share/doc" -type f -exec chmod 0644 {} \;
  install -Dm644 doc/license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
