# Maintainer: Tim Lagnese tim@inept.tech

pkgname=ada_language_server-bin
pkgver=2027.0.202610121
pkgrel=1
epoch=1
pkgdesc="High performance syntactic and semantic engine for the Ada programming language"
arch=('x86_64')
url="https://github.com/AdaCore/ada_language_server"
license=('GPL3')
conflicts=('ada_language_server' 'ada_language_server-git')
provides=('ada_language_server')
depends=('gmp' 'glibc' 'gcc-libs')
makedepends=('patchelf')

source=("https://github.com/AdaCore/ada_language_server/releases/download/$pkgver/als-$pkgver-linux-x64.tar.gz")
b2sums=('f90ff237e1ce0c7920dd4303b3473936487f27ca263094b9971afd149585d265bc9fe96486ed1154e536f0d754b65696adaa59a3b16a3c686ab2d80c35db6f4b')

prepare() {
  cd "$srcdir/integration/vscode/ada/x64/linux"

  # Resolve "Insecure RPATH" namcap error
  patchelf --remove-rpath ${pkgname%-bin}
}

package() {
  cd "$srcdir/integration/vscode/ada/x64/linux"

  install -D --target-directory=$pkgdir/usr/bin ${pkgname%-bin}
}
