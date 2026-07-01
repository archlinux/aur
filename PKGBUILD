# Maintainer: David Kantun <dkantun@gmail.com>

pkgname=proclama
pkgver=1.1.0
pkgrel=1
pkgdesc="Presentador multimedia moderno y rápido diseñado para iglesias, con control remoto"
arch=('x86_64')
url="https://github.com/Gargadon/Proclama"
license=('MIT')
depends=('qt6-base' 'qt6-multimedia' 'qt6-svg' 'qt6-webengine' 'openssl')
makedepends=('cmake' 'qt6-tools' 'ninja')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Gargadon/Proclama/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c7ea198b6370aae62121fdc3e226937af7b6a56e5caa1edf58d0e01567f146d4')

build() {
  cmake -B build -S "Proclama-$pkgver" \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  # Instalar el ejecutable principal
  install -Dm755 build/Proclama "$pkgdir/usr/bin/Proclama"

  # Instalar el archivo de escritorio (.desktop)
  install -Dm644 "Proclama-$pkgver/Proclama.desktop" "$pkgdir/usr/share/applications/Proclama.desktop"

  # Instalar el icono de la aplicación
  install -Dm644 "Proclama-$pkgver/src/resources/images/proclama-logo.png" "$pkgdir/usr/share/pixmaps/proclama-logo.png"

  # Instalar la licencia
  install -Dm644 "Proclama-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
