# $Id$
# Maintainer: archaurwiki <archaurwiki at i2pmail dot org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: d'Ronin <daronin@2600.com>
# Contributor: Hexchain Tong <richard0053@gmail.com>

pkgname=botan-stable
pkgver=1.10.10
pkgrel=1
pkgdesc='Crypto library written in C++'
license=('BSD')
arch=('x86_64' 'i686')
url='http://botan.randombit.net/'
depends=('gcc-libs' 'sh' 'asio')
makedepends=('python2' 'asio' 'git')
provides=('botan')
conflicts=('botan')
validpgpkeys=('621DAF6411E1851C4CF9A2E16211EBF1EFBADFBC')
source=("http://botan.randombit.net/releases/Botan-${pkgver}.tgz"{,.asc})
sha256sums+=('6b67b14746410461fe4a8ce6a625e7eef789243454fe30eab7329d5984be4163'
           'c37766426b09f6103e7f14713c88e09ff053df645352457bf45069e83deb47a0')

prepare() {
  # Use python2 for the installation scripts
  find . -name '*.py' -exec sed -i -e '1s,python$,python2,' {} +
}

build() {
  cd Botan-${pkgver}
  python2 configure.py --prefix=/usr --enable-modules=cvc --with-openssl --with-gnump --with-bzip2 --with-zlib
  make
}

package() {
  cd Botan-${pkgver}
  make DESTDIR="$pkgdir/usr" install
  find "$pkgdir/usr/share/doc" -type f -exec chmod 0644 {} \;
  install -Dm644 doc/license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
