# Maintainer: Stdqman <stdqman@proton.me>
pkgname=ocamel-git
_pkgname=ocamel
pkgver=r4.4e73cb3
pkgrel=1
pkgdesc="Ollama için Gelişmiş Qt6 Arayüzü: RAG, Web Gezgini ve Vibe Coding"
arch=('x86_64')
url="https://gitlab.com/stdqman/ocamel"  # <-- BURAYI DÜZENLE!
license=('LGPL3')
depends=('qt6-base' 'qt6-webengine' 'ollama' 'ripgrep' 'clang')
makedepends=('git' 'cmake' 'base-devel')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  # Son commit sayısına göre versiyon üretir (Örn: r15.a1b2c3d)
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  # Build klasörünü temizle ve oluştur
  rm -rf build
  cmake -B build -S "$_pkgname" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
    
  cmake --build build
}

package() {
  # Sisteme kurar gibi paketler
  DESTDIR="$pkgdir" cmake --install build
}
