# Maintainer: Tim Lagnese tim@inept.tech

pkgname=ada_language_server-bin
pkgver=26.0.202502240
pkgrel=1
pkgdesc="High performance syntactic and semantic engine for the Ada programming language"
arch=('x86_64')
url="https://github.com/AdaCore/ada_language_server"
license=('GPL3')
conflicts=('ada_language_server' 'ada_language_server-git')
provides=('ada_language_server')
depends=('gmp' 'glibc' 'gcc-libs')
makedepends=('patchelf')

source=("https://github.com/AdaCore/ada_language_server/releases/download/$pkgver/als-$pkgver-linux-x64.tar.gz")
b2sums=('a0361a5ccc7fd1c032aca72899cac3c87e33987dd764dcf0eab8cc310e62ec11f4a2d2ce1d0133b2c9f1d177fe3d379d6cb7ddd05222ba275048891bd32ac1e9')

prepare() {
  cd "$srcdir/integration/vscode/ada/x64/linux"

  # Resolve "Insecure RPATH" namcap error
  patchelf --remove-rpath ${pkgname%-bin}
}

package() {
  cd "$srcdir/integration/vscode/ada/x64/linux"

  install -D --target-directory=$pkgdir/usr/bin ${pkgname%-bin}
}
