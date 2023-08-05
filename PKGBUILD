# Maintainer: Reverier-Xu <reverier.xu@woooo.tech>
pkgname=bitwave-git
_pkgname=bitwave-git
pkgver=v0.3.0dev.r6.gcfafd5c
pkgrel=2
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
  git checkout dev
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
  make -C build -j12
  echo -e "\033[31m=====================================\033[0m"
  echo -e "\033[31mThe library feature is not ready now\033[0m"
  echo -e "\033[31mYou can use the `Open` button on the titlebar to import media(s), multiple file selection is supported.\033[0m"
  echo -e "\033[31m自动扫描本地音乐在重构后暂未实现\033[0m"
  echo -e "\033[31m你可以先用标题栏上的`打开`按钮凑合一下，支持一次选择多个文件。\033[0m"
  echo -e "\033[31m=====================================\033[0m"
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$_name"/desktop/tech.woooo.bitwave.desktop "$pkgdir"/usr/share/applications/tech.woooo.bitwave.desktop
  install -Dm644 "$_name"/desktop/tech.woooo.bitwave.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/tech.woooo.bitwave.svg
}
