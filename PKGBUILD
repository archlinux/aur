# Maintainer: Tim Lagnese tim@inept.tech

pkgname=ada_language_server-bin
pkgver=2026.0.202510141
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
b2sums=('3efb99e75be890cf6b9ffe463bb1fd7a24f6c71a46528246f5f01df8dd7f7056de8ae94bb3417d8c6fe242ef2b162d5a1cd4063c40770087a389fb6b1d1b8f1c')

prepare() {
  cd "$srcdir/integration/vscode/ada/x64/linux"

  # Resolve "Insecure RPATH" namcap error
  patchelf --remove-rpath ${pkgname%-bin}
}

package() {
  cd "$srcdir/integration/vscode/ada/x64/linux"

  install -D --target-directory=$pkgdir/usr/bin ${pkgname%-bin}
}
