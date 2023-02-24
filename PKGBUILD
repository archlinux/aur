# $Id: PKGBUILD 226039 2017-04-27 13:52:30Z felixonmars $
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: csslayer <wengxt AT gmail com>

_pkgname=fcitx5-chinese-addons
pkgname=${_pkgname}-git
pkgver=5.0.16.r20.g3d0b578
pkgrel=2
pkgdesc="Addons related to Chinese, including IME previous bundled inside fcitx4"
arch=('i686' 'x86_64')
url="https://github.com/fcitx/fcitx5-chinese-addons"
license=('GPL')
depends=('curl' 'libime-git' 'qt5-webengine' 'fcitx5-qt5-git' 'opencc')
makedepends=('boost' 'extra-cmake-modules' 'git' 'fcitx5-lua-git' 'ninja')
optdepends=('fcitx5-lua-git: Lua and imeapi support from pinyin')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd fcitx5-chinese-addons
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
  cd fcitx5-chinese-addons

  cmake -GNinja -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib -DUSE_WEBKIT=off .
  ninja
}

package() {
  cd fcitx5-chinese-addons
  DESTDIR="$pkgdir" ninja install
}
