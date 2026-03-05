# Maintainer: Lu Xu <oliver_lew at outlook dot com>
# Contributor: 1654755689 <1654755689 at qq dot com>

_pkgname=fcitx5-chinese-addons
pkgname=${_pkgname}-without-browser
pkgver=5.1.11
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
sha512sums=('b18172c7030dbb24a7f04d2258ee04eef3f8838bf6f0df7ae185af9cef27c9c156cc23f34d73a329ca5dac6d0e2553e513e2c59bb468ce46df86f3ccb5c9f839')

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
