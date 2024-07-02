# Maintainer: 1654755689 <1654755689 at qq dot com>

_pkgname=fcitx5-chinese-addons
pkgname=${_pkgname}-without-browser
pkgver=5.1.6
pkgrel=1
pkgdesc="Addons related to Chinese, including IME previous bundled inside fcitx4, without browser"
arch=('x86_64')
url="https://github.com/fcitx/fcitx5-chinese-addons"
license=('LGPL-2.1-or-later' 'Unicode-DFS-2016')
depends=('curl' 'fcitx5-qt' 'hicolor-icon-theme' 'libime' 'opencc')
makedepends=('boost' 'extra-cmake-modules' 'fcitx5-lua' 'fmt' 'ninja')
optdepends=('fcitx5-lua: Lua and imeapi support from pinyin')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/fcitx/fcitx5-chinese-addons/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('4bc71c2dc42e59875b5eae926162fa601ac3fb5f0ae18439912ead1f9b54c25a5f5d8cc7cfa2e4c8b7e12684e0640112fdf7fc38a652fe6b86ab3a65e847f5ca')

build() {
	cd ${_pkgname}-${pkgver}
	cmake -GNinja -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib -DENABLE_BROWSER=off .
	ninja
}

package() {
	cd ${_pkgname}-${pkgver}
	install -Dm644 COPYING.unicode "$pkgdir/usr/share/licenses/$pkgname/Unicode-DFS-2016.txt"
	DESTDIR="$pkgdir" ninja install
}
