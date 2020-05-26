# Maintainer: Jonathan Knapp <jaknapp8+aur@gmail.com>
# URL: https://github.com/ValveSoftware/GameNetworkingSockets
# Upstream: https://github.com/ValveSoftware/GameNetworkingSockets

pkgname=('gamenetworkingsockets-git')
pkgver=1.1.0.89.g1748a3b
pkgrel=1
pkgdesc="Reliable & unreliable messages over UDP. Robust message fragmentation & reassembly. Encryption."
arch=('x86_64')
url='https://github.com/ValveSoftware/GameNetworkingSockets'
license=('BSD')
depends=('protobuf' 'openssl')
makedepends=('cmake' 'ninja')
#optdepends=()
provides=('libGameNetworkingSockets.so')
# conflicts=()
source=("$pkgname::git+https://github.com/ValveSoftware/GameNetworkingSockets.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^v//;s/-/./g'
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p build;
  cd build;
  cmake -G Ninja ..
  ninja

  install -D -m644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 644 "src/libGameNetworkingSockets.so" -t "$pkgdir/usr/lib";
}
