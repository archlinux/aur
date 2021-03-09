# Maintainer: Jonathan Knapp <jaknapp8+aur@gmail.com>
# URL: https://github.com/ValveSoftware/GameNetworkingSockets
# Upstream: https://github.com/ValveSoftware/GameNetworkingSockets

pkgname=('gamenetworkingsockets-git')
pkgver=1.2.0.158.g332da08
pkgrel=1
pkgdesc="Reliable & unreliable messages over UDP. Robust message fragmentation & reassembly. Encryption."
arch=('x86_64')
url='https://github.com/ValveSoftware/GameNetworkingSockets'
license=('BSD')
depends=('protobuf' 'openssl')
makedepends=('cmake' 'ninja')
#optdepends=()
provides=('gamenetworkingsockets')
# conflicts=()
source=("$pkgname::git+https://github.com/ValveSoftware/GameNetworkingSockets.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^v//;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  mkdir -p build;
  cd build;
  cmake -G Ninja ..
  ninja
}

package() {
  cd "$srcdir/$pkgname"
  install -D -m644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 "build/bin/libGameNetworkingSockets.so" -t "$pkgdir/usr/lib"
}
