# Maintainer: Tim Lagnese tim@inept.tech

pkgname=ada_language_server-bin
pkgver=26.0.202411173
pkgrel=2
pkgdesc="High performance syntactic and semantic engine for the Ada programming language"
arch=('x86_64')
url="https://github.com/AdaCore/ada_language_server"
license=('GPL3')
conflicts=('ada_language_server' 'ada_language_server-git')
provides=('ada_language_server')
depends=('gmp' 'glibc' 'gcc-libs')
makedepends=('patchelf')

source=("https://github.com/AdaCore/ada_language_server/releases/download/$pkgver/als-$pkgver-linux-x64.tar.gz")
b2sums=('a913e30c995eff8b5ed6d15289fef588ce8643430f71ae39fcd34c077b4e59512e9231808e0e9b05a1ff6165f0f2e65d7c01b7db6e50f9c4a55b6477ff2ef044')

prepare() {
  cd "$srcdir/integration/vscode/ada/x64/linux"

  # Resolve "Insecure RPATH" namcap error
  patchelf --remove-rpath ${pkgname%-bin}
}

package() {
  cd "$srcdir/integration/vscode/ada/x64/linux"

  install -D --target-directory=$pkgdir/usr/bin ${pkgname%-bin}
}
