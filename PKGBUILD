# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: csslayer <wengxt AT gmail com>

pkgbase=fcitx
pkgname=('fcitx' 'fcitx-gtk2' 'fcitx-gtk3' 'fcitx-qt')
pkgver=4.2.6.1
pkgrel=5
groups=('fcitx-im')
arch=('i686' 'x86_64')
url="http://code.google.com/p/fcitx/"
license=('GPL')
makedepends=('cmake' 'intltool' 'doxygen' 'gtk2' 'gtk3' 'qt' 'icu' 'wget' \
             'iso-codes' 'gobject-introspection' 'libxkbfile' 'enchant')
source=(http://fcitx.googlecode.com/files/${pkgbase}-${pkgver}.tar.xz)
sha1sums=('dc4577bb6bd6de41317f978196f377fc801cc63a')

build() {
  cd "${srcdir}"
  mkdir build
  cd build
  cmake ../${pkgbase}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_OPENCC=OFF \
    -DFORCE_PRESAGE=ON \
    -DENABLE_TEST=ON \
    -DENABLE_GTK3_IM_MODULE=ON \
    -DENABLE_QT_IM_MODULE=ON
  make
}

check() {
  cd "${srcdir}"/build
  make test
}

package_fcitx() {
  pkgdesc="Flexible Context-aware Input Tool with eXtension"
  depends=('pango' 'libxinerama' 'gtk-update-icon-cache' 'shared-mime-info' \
           'hicolor-icon-theme' 'desktop-file-utils' 'libxkbfile' \
           'libxfixes' 'dbus-core' 'icu')
  optdepends=('enchant: for word predication support'
  	      'fcitx-anthy: Hiragana text to Kana Kanji mixed text Japanese input method'
	      'fcitx-chewing: Intelligent Zhuyin input method library for traditional Chinese'
	      'fcitx-cloudpinyin: Standalone module for fcitx that uses pinyin API on the internet to provide additional input candidates'
	      'fcitx-configtool: GTK based config tool for Fcitx'
	      'fcitx-fbterm: Fbterm support for Fcitx'
	      'fcitx-googlepinyin: A fork from google pinyin on android for Fcitx'
	      'fcitx-gtk2: GTK2 IM Module for fcitx'
	      'fcitx-gtk3: GTK3 IM Module for fcitx'
	      'fcitx-hangul: Hangul (Korean) support for fcitx'
	      'fcitx-libpinyin: Fcitx Wrapper for libpinyin, Library to deal with pinyin'
	      'fcitx-m17n: Multilingual text processing library'
	      'fcitx-mozc: Fcitx Module of A Japanese Input Method for Chromium OS, Windows, Mac and Linux (the Open Source Edition of Google Japanese Input)'
	      'fcitx-qt: QT IM Module for fcitx'
	      'fcitx-rime: Rime input method engine (Traditional Chinese)'
  	      'fcitx-sunpinyin: Statistical Language Model based pinyin IME by Sun'
	      'fcitx-table-extra: Extra tables for Fcitx, including Boshiamy, Zhengma, Cangjie3, Cangjie5'
	      'fcitx-table-other: Provides some other tables for Fcitx, fork from ibus-table-others, scim-tables'
	      'fcitx-ui-light: Light weight xlib and xft based ui for fcitx'
	      'fcitx-unikey: Fcitx Wrapper for unikey'
	      'kcm-fcitx: KDE Config Module for Fcitx')
  install=fcitx.install

  cd "${srcdir}"/build
  make DESTDIR="${pkgdir}" install

  rm -r "${pkgdir}"/usr/lib/{gtk-2.0,gtk-3.0,qt}
}

package_fcitx-gtk2() {
  pkgdesc='GTK2 IM Module for fcitx'
  depends=('gtk2' 'fcitx')
  install=fcitx-gtk2.install

  cd "${srcdir}"/build/src/frontend/gtk2
  make DESTDIR="${pkgdir}" install
}

package_fcitx-gtk3() {
  pkgdesc='GTK3 IM Module for fcitx'
  depends=('gtk3' 'fcitx')
  install=fcitx-gtk3.install

  cd "${srcdir}"/build/src/frontend/gtk3
  make DESTDIR="${pkgdir}" install
}

package_fcitx-qt() {
  pkgdesc='QT IM Module for fcitx'
  depends=('qt' 'fcitx')

  cd "${srcdir}"/build/src/frontend/qt
  make DESTDIR="${pkgdir}" install
}
