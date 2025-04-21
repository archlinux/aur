# Maintainer: Tim Lagnese tim@inept.tech

pkgname=ada_language_server-bin
pkgver=26.0.202504012
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
b2sums=('d821be2af86b9a1905cfef9c7fc52b0ae4fcaad33d7d269b1c1e767f175ef8170e54cf77dc639f00da125d3efd7469ef6887ad3b72e03a4dfdc802ec7d705bde')

prepare() {
  cd "$srcdir/integration/vscode/ada/x64/linux"

  # Resolve "Insecure RPATH" namcap error
  patchelf --remove-rpath ${pkgname%-bin}
}

package() {
  cd "$srcdir/integration/vscode/ada/x64/linux"

  install -D --target-directory=$pkgdir/usr/bin ${pkgname%-bin}
}
