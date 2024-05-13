# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: bemxio <bemxiov at protonmail dot com>
# Contributor: Joe Carta <cartakid at gmail dot com>
# Contributor: sidious/SiD <miste78 web de>
# Contributor: Wes Brewer <brewerw@gmail.com>

pkgname=extract-xiso
pkgver=202303040307
_commit=3438285c5098757b112215c131e837876b566d31
pkgrel=3
pkgdesc="Xbox ISO Creation/Extraction utility"
url="https://github.com/XboxDev/extract-xiso"
license=("BSD-4-Clause")
arch=('x86_64' 'i686')
depends=('lib32-glibc')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('798d37a440bd3f05373c0e4f4c6a9cb462eef0bf5f6e4c8ce1b631d6502e1ead')

prepare() {
  cd $pkgname-$_commit
  mkdir -p build
  cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_C_FLAGS=-m32
}

build() {
  cd $pkgname-$_commit/build
  make
}

package() {
  cd $pkgname-$_commit
  install -Dm644 LICENSE.TXT -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm755 build/$pkgname -t "$pkgdir/usr/bin"
}
