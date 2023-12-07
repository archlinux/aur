# Maintainer: Tim Lagnese tim@inept.tech

pkgname=ada_language_server-bin
pkgver=24.0.3
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
b2sums=('68b71abec750da5d3975337af9a41713970be16cfeb45e02ad9fbde5b416951042009f992fba85d24af9a80b920e359a93ff6604e6ffc35666445d14fb4cf5fd')

prepare() {
  cd "$srcdir/x64/linux"

  # Resolve "Insecure RPATH" namcap error
  patchelf --remove-rpath ${pkgname%-bin}
}

package() {
  cd "$srcdir/x64/linux"

  install -D --target-directory=$pkgdir/usr/bin ${pkgname%-bin}
}
