# Maintainer: Your Name <ikunji@duck.com>
pkgname=krunner-pinyin-search
pkgver=r5.8759888
pkgrel=2
pkgdesc="一个krunner插件，为KDE提供了用拼音搜索应用程序的功能。支持全拼/首字母/汉字混合输入。"
arch=(x86_64)
url="https://github.com/AOSC-Dev/krunner-pinyin-search"
license=('LGPL-2.1-or-later')
depends=(qt6-base krunner ki18n kcoreaddons kio)
makedepends=(cmake extra-cmake-modules qt6-tools git)
source=("git+https://github.com/AOSC-Dev/krunner-pinyin-search.git")
sha256sums=('SKIP')
install=${pkgname}.install

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  cmake -B build -S . \
    -DCMAKE_BUILD_TYPE=Release \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cd "$pkgname"
  cmake --install build --prefix="$pkgdir/usr"
}

post_install() {
  echo ">>> Please restart KRunner for the plugin to take effect."
  echo "    You can do this with: kquitapp6 krunner"
}

post_upgrade() {
  post_install
}

pre_remove() {
  echo ">>> Tip: After removing this plugin, you may need to restart KRunner."
  echo "    You can do this with: kquitapp6 krunner"
}
