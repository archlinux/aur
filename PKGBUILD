# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrew Eikum

pkgname=faudio
pkgver=23.10
_commit=a26a9a8ebab96a2fa99ee6aa01af1c76f71725fb
pkgrel=1
pkgdesc="XAudio2 reimplementation"
arch=(x86_64)
url="https://github.com/FNA-XNA/FAudio/"
license=('custom:zlib')
depends=('sdl2' 'gst-libav')
makedepends=('git' 'cmake' 'ninja')
source=("git+https://github.com/FNA-XNA/FAudio.git#commit=$_commit")
sha512sums=('SKIP')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../FAudio -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  ninja
}

package() {
  DESTDIR="$pkgdir" ninja -C build install

  install -Dm644 FAudio/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
