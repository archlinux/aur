# fconvert v2.0.3 (c) 2023 - 2026 Eraldo Bako - MIT License
# Maintainer: Eraldo Bako <eraldobako@gmail.com>
pkgname=fconvert
pkgver=2.0.3
pkgrel=1
pkgdesc="A fast, intentional CLI file converter for images, audio, and video."
arch=('x86_64')
url="https://github.com/Eraldo-Bako/fconvert"
license=('MIT')
depends=('opencv' 'ffmpeg')
makedepends=('gcc' 'cmake')
source=("git+${url}.git")
md5sums=('SKIP')

build() {
  cd "$pkgname"

  echo "fconvert==> Attempting compilation via CMake..."
  if cmake -B build -S . -DCMAKE_BUILD_TYPE=Release && cmake --build build; then
    echo "fconvert==> CMake build successful!"
    cp build/fconvert .
  else
    echo "fconvert==> WARNING: CMake build failed. Falling back to manual g++ compilation..."
    rm -rf build     
    g++ -o fconvert main.cpp classes/*.cpp `pkg-config --cflags --libs opencv4` -lstdc++fs
  fi
}

package() {
  cd "$pkgname"
  install -Dm755 fconvert "$pkgdir/usr/bin/fconvert"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}