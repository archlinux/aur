# Maintainer: Tim Lagnese tim@inept.tech

pkgname=ada_language_server-bin
pkgver=24.0.3
pkgrel=2
pkgdesc="High performance syntactic and semantic engine for the Ada programming language"
arch=('x86_64')
url="https://github.com/AdaCore/ada_language_server"
license=('GPL3')
conflicts=('ada_language_server' 'ada_language_server-git')
provides=('ada_language_server')
depends=('gmp' 'glibc')
makedepends=('patchelf')

source=("https://github.com/AdaCore/ada_language_server/releases/download/$pkgver/als-$pkgver-Linux_amd64.zip")
b2sums=('8cf1d7b52ccbe86a3765ad22ccc9d5cd917dff4f94942abfb0b4957b8d930a77bb046d79c884dc7175044b6c96ecedb4470a6c7af936bc39e81c5505b82d4ca0')

prepare() {
  cd "$srcdir/x64/linux"

  # Resolve "Insecure RPATH" namcap error
  patchelf --remove-rpath ${pkgname%-bin}
}

package() {
  cd "$srcdir/x64/linux"

  install -D --target-directory=$pkgdir/usr/bin ${pkgname%-bin}
}
