# Maintainer: Tim Lagnese tim@inept.tech

pkgname=ada_language_server-bin
pkgver=24.0.2
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
b2sums=('a5eaf3748aa659f729f5e9c6f48c6dfd4ef6f8089d17ae1d4ee72f6385ccc0d0b681d4035c1b861e7fe25492783333ae2d53d09af0a623d886014e6b96a6338e')

prepare() {
  cd "$srcdir/x64/linux"

  # Resolve "Insecure RPATH" namcap error
  patchelf --remove-rpath ${pkgname%-bin}
}

package() {
  cd "$srcdir/x64/linux"

  install -D --target-directory=$pkgdir/usr/bin ${pkgname%-bin}
}
