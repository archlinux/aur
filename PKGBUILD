# Maintainer: 1654755689 <1654755689 at qq dot com>

_pkgname=fcitx5-chinese-addons
pkgname=${_pkgname}-without-browser
pkgver=5.1.6
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
sha512sums=('a5f654bb9b2d1c6e4c8802b9ad7d57e7d6057974ee0e3a22df75b6f2581057624c0f2292504b7b023f4d10ebb98f26f1a38a1e10fac25604cb44aedcaec77f5b')

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
