# Maintainer: Lu Xu <oliver_lew at outlook dot com>
# Contributor: 1654755689 <1654755689 at qq dot com>

_pkgname=fcitx5-chinese-addons
pkgname=${_pkgname}-without-browser
pkgver=5.1.12
pkgrel=1
pkgdesc='Addons related to Chinese, including IME previous bundled inside fcitx4, without webkit or webengine dependencies'
arch=('x86_64')
url='https://github.com/fcitx/fcitx5-chinese-addons'
license=('LGPL-2.1-or-later' 'Unicode-DFS-2016')
depends=('fcitx5-qt' 'libime' 'opencc' 'hicolor-icon-theme')
makedepends=('boost' 'extra-cmake-modules' 'fcitx5-lua' 'fmt' 'ninja')
optdepends=('fcitx5-lua: Lua and imeapi support from pinyin')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${_pkgname}_${pkgver}.tar.gz"::"${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('b60de3b84dbb091f1301367ba9d2e8228735bf7a0ff125b738b8363c74b2ff32')

build() {
  cd ${_pkgname}-${pkgver}
  cmake -Wno-dev -GNinja \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_INSTALL_LIBDIR=/usr/lib \
      -DENABLE_BROWSER=off .
  ninja
}

package() {
  cd ${_pkgname}-${pkgver}
  install -Dm644 COPYING.unicode "${pkgdir}/usr/share/licenses/${pkgname}/Unicode-DFS-2016.txt"
  DESTDIR="$pkgdir" ninja install
}
