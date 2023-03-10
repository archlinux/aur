# Maintainer: Reverier-Xu <reverier.xu@outlook.com>
pkgname=bitwave-git
_pkgname=bitwave-git
pkgver=v0.2.5dev.r1.ge4cd883
pkgrel=5
pkgdesc="A simple media player based on Qt and MPV."
arch=('x86_64')
url="https://github.com/Reverier-Xu/BitWave"
license=('MPL')
depends=('qt5-base' 'qt5-svg' 'qt5-quickcontrols2' 'qt5-translations' 'qt5-wayland' 'ffmpeg' 'mpv' 'qt5-x11extras' 'qt5-graphicaleffects')
makedepends=('cmake' 'extra-cmake-modules' 'git')
provides=("BitWave")
source=('git+https://github.com/Reverier-Xu/BitWave.git')
md5sums=('SKIP')
_name=BitWave
prepare() {
  cd $_name
  git submodule update --init --recursive
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
  make -C build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$_name"/desktop/tech.woooo.bitwave.desktop "$pkgdir"/usr/share/applications/tech.woooo.bitwave.desktop
  install -Dm644 "$_name"/desktop/tech.woooo.bitwave.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/tech.woooo.bitwave.svg
}
