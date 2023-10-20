# Maintainer: Tim Lagnese tim@inept.tech

pkgname=ada_language_server-bin
pkgver=24.0.1
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
b2sums=('46c01d697778bc20c8f64208770cd6bdc04ed229920bc582578aaf5719a7528afc9cbb0ec26c9e16c7f4afdca88c5b77c23686f2d6b8110447dc570c99b74c7a')

prepare() {
  cd "$srcdir/linux"

  # Resolve "Insecure RPATH" namcap error
  patchelf --remove-rpath ${pkgname%-bin}
}

package() {
  cd "$srcdir/linux"

  install -D --target-directory=$pkgdir/usr/bin ${pkgname%-bin}
}
