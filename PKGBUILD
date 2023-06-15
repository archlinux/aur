# Maintainer: Tim Lagnese tim@inept.tech

pkgname=ada_language_server-bin
pkgver=23.0.18
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
b2sums=('b59238328b40a5f02cfe73bcf79fc62813bf94041626530949b4e66a6a15612bb6d04ee48fbfcbc59f9e2f3dd08ff4e3a5cf2a0c378ff739ec6f55f2da493350')

prepare() {
  cd "$srcdir/linux"

  # Resolve "Insecure RPATH" namcap error
  patchelf --remove-rpath ${pkgname%-bin}
}

package() {
  cd "$srcdir/linux"

  install -D --target-directory=$pkgdir/usr/bin ${pkgname%-bin}
}
