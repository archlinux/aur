# Maintainer: Tim Lagnese tim@inept.tech

pkgname=ada_language_server-bin
pkgver=23.0.19
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
b2sums=('be01b20269e9d726a4964bc35f0fe94fd0f84b9bf9e0338cabb3cb5237cf5c4b7417efb2b12dc8ad64d4be251c539e8779567e27c443447ba7c774ba7ee2a085')

prepare() {
  cd "$srcdir/linux"

  # Resolve "Insecure RPATH" namcap error
  patchelf --remove-rpath ${pkgname%-bin}
}

package() {
  cd "$srcdir/linux"

  install -D --target-directory=$pkgdir/usr/bin ${pkgname%-bin}
}
