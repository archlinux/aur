# Maintainer: Tim Lagnese tim@inept.tech

pkgname=ada_language_server-bin
pkgver=24.0.4
pkgrel=1
pkgdesc="High performance syntactic and semantic engine for the Ada programming language"
arch=('x86_64')
url="https://github.com/AdaCore/ada_language_server"
license=('GPL3')
conflicts=('ada_language_server' 'ada_language_server-git')
provides=('ada_language_server')
depends=('gmp' 'glibc')
makedepends=('patchelf')

source=("https://github.com/AdaCore/ada_language_server/releases/download/$pkgver/als-$pkgver-Linux_amd64.zip")
b2sums=('37301273a60ca6aa6f65c482fe987dfae4ea16dfd23a76348603cb25f3e42e25c1da90fa8b93f8d2741f74945f7768807eefbdaf885db3ea0ed87fab1d170f36')

prepare() {
  cd "$srcdir/x64/linux"

  # Resolve "Insecure RPATH" namcap error
  patchelf --remove-rpath ${pkgname%-bin}
}

package() {
  cd "$srcdir/x64/linux"

  install -D --target-directory=$pkgdir/usr/bin ${pkgname%-bin}
}
