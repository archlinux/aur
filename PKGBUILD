# Maintainer: Lu Xu <oliver_lew at outlook dot com>
# Contributor: 1654755689 <1654755689 at qq dot com>

_pkgname=fcitx5-chinese-addons
pkgname=${_pkgname}-without-browser
pkgver=5.1.8
pkgrel=1
pkgdesc='Addons related to Chinese, including IME previous bundled inside fcitx4, without browser'
arch=('x86_64')
url='https://github.com/fcitx/fcitx5-chinese-addons'
license=('LGPL-2.1-or-later' 'Unicode-DFS-2016')
depends=('fcitx5-qt' 'libime' 'opencc')
makedepends=('boost' 'extra-cmake-modules' 'fcitx5-lua' 'fmt' 'ninja')
optdepends=('fcitx5-lua: Lua and imeapi support from pinyin')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${_pkgname}_${pkgver}.tar.gz"::"${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('91a4c9a13c141d6bce958f74afc87a32ff481664f24019022c039bcb7472075cf10227afd471596a165973b47003b6a93884a0b29d2785c6bc795d914ba16cf1')

build() {
  cd ${_pkgname}-${pkgver}
  cmake -GNinja -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib -DUSE_WEBKIT=off -DENABLE_BROWSER=off .
  ninja
}

package() {
  cd ${_pkgname}-${pkgver}
  install -Dm644 COPYING.unicode "${pkgdir}/usr/share/licenses/${_pkgname}/Unicode-DFS-2016.txt"
  DESTDIR="$pkgdir" ninja install
}
