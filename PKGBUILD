# Maintainer: Jordan MacDonald <jordan(at)wastedintelligence(dot)com>
pkgname=amp
pkgver=0.5.2
pkgrel=2
pkgdesc='A modal text editor for the terminal.'
arch=('x86_64')
url='https://github.com/jmacdonald/amp'
license=('GPL3')
depends=('libxcb')
makedepends=('rust' 'git' 'python2' 'cmake' 'libxcb')
source=('python' "https://github.com/jmacdonald/$pkgname/archive/$pkgver.tar.gz")
sha512sums=(
  'c9fe91a5958a04fcb6039d0791ac14c014ad0b85b0b30118574c64596169a71261037e2eb26c0b5cee686c90f56a5b04ffef96b0ccb455bcc3d7cc989434bcef'
  '2e3e9bcac33cc47308bbf062a6bb6fa763567fcc760c0bee18eec78829201f568e53c7e68984ba8fbb3bee6a1454fd98fe50c00047bb569754f3cd4e96de0166'
)

build() {
  cd "$pkgname-$pkgver"

  # Set up python => python2 shim.
  rm -rf python_bin
  mkdir python_bin
  cp ../python python_bin/
  export PATH="$(pwd)/python_bin:$PATH"

  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/amp" "$pkgdir/usr/bin/amp"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
