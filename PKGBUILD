# Maintainer: Reverier-Xu <reverier.xu@woooo.tech>
pkgname=bitwave-git
_pkgname=bitwave-git
pkgver=v0.3.0dev.r10.g4f40493
pkgrel=1
pkgdesc="A simple media player based on Qt and MPV."
arch=('x86_64')
url="https://github.com/Reverier-Xu/BitWave"
license=('MPL')
depends=('qt6-base' 'qt6-svg' 'qt6-translations' 'qt6-wayland' 'ffmpeg' 'mpv')
makedepends=('cmake' 'extra-cmake-modules' 'git')
provides=("BitWave")
source=('git+https://github.com/Reverier-Xu/BitWave.git')
md5sums=('SKIP')
_name=BitWave
prepare() {
  cd $_name
}

pkgver() {
  cd $_name
  git describe --long --tags | sed 's|^upstream/||;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S $_name \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
  make -C build -j20
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$_name"/desktop/tech.woooo.bitwave.desktop "$pkgdir"/usr/share/applications/tech.woooo.bitwave.desktop
  install -Dm644 "$_name"/desktop/tech.woooo.bitwave.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/tech.woooo.bitwave.svg
}
