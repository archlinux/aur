# Maintainer: Jose <tu-email@ejemplo.com>
pkgname=wtop
pkgver=0.1.1
pkgrel=1
pkgdesc="Un monitor de sistema ligero y rápido escrito en Rust"
arch=('x86_64')
url="https://github.com/josema294/wtop"
license=('AGPL3')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/release.tar.gz")
sha256sums=('62427d393e7591c05305c00e3e3ad44283e066e453e062f7d2667e349622d732')

build() {
  cd "$pkgname-release"
  # --locked asegura que use las versiones exactas de Cargo.lock
  cargo build --release --locked
}

package() {
  cd "$pkgname-release"
  # Instalamos el binario en /usr/bin/ dentro del paquete
  install -Dm755 "target/release/wtop" "$pkgdir/usr/bin/wtop"
  
  # Opcional: Instalar la licencia si es requerida por las normas de Arch
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
