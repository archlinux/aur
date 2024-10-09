# Maintainer: 1654755689 <1654755689 at qq dot com>

_pkgname=fcitx5-chinese-addons
pkgname=${_pkgname}-without-browser
pkgver=5.1.7
pkgrel=2
pkgdesc='Addons related to Chinese, including IME previous bundled inside fcitx4, without browser'
arch=('x86_64')
url='https://github.com/fcitx/fcitx5-chinese-addons'
license=('LGPL-2.1-or-later' 'Unicode-DFS-2016')
depends=('fcitx5-qt' 'hicolor-icon-theme' 'libime' 'opencc')
makedepends=('boost' 'extra-cmake-modules' 'fcitx5-lua' 'fmt' 'ninja')
optdepends=('fcitx5-lua: Lua and imeapi support from pinyin')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${_pkgname}"::"git+${url}.git?#tag=${pkgver}")
sha512sums=('6c44c99d2ae9545735f710c750a11c95009a44e94a80f26e8e32a48c5a2c261eca050e0dc4299485644d50b3ccb60be6c402800338dcbdc3e08246e4ff507f40')

build() {
  cd ${_pkgname}
  cmake -GNinja -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib -DENABLE_BROWSER=off -DENABLE_CLOUDPINYIN=off .
  ninja
}

package() {
  cd ${_pkgname}
  install -Dm644 COPYING.unicode "${pkgdir}/usr/share/licenses/${_pkgname}/Unicode-DFS-2016.txt"
  DESTDIR="$pkgdir" ninja install
}
