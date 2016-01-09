# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Michael Healy <horsemanoffaith@gmail.com>
# Contributor: Balló György <ballogyor+arch@gmail.com>
# Contributor: thn81 <root@scrat>

# vercheck-pkgbuild: auto
# vercheck-ubuntu: name=${pkgname}, repo=wily
# vercheck-launchpad: name=${pkgname}

pkgname=ido
_actual_ver=13.10.0
_extra_ver=+15.10.20151002
pkgver=${_actual_ver}${_extra_ver/\+/.}
pkgrel=1
epoch=1
pkgdesc="Widgets and other objects used for indicators"
arch=(i686 x86_64)
url="https://launchpad.net/ido"
license=(LGPL)
depends=(gtk3-ubuntu)
makedepends=(gobject-introspection gtk-doc vala xorg-util-macros)
groups=(unity)
source=("https://launchpad.net/ubuntu/+archive/primary/+files/ido_${_actual_ver}${_extra_ver}.orig.tar.gz"
        0001-Temporarily-disable-previous-button-drop-shadow-draw.patch)
sha512sums=('df6b991819da8c680b8019c4834bfe35ca2de8c22c4a49e8f2775da47ebd705df91b73bf95b98d0e9cd3cdad1244c75996febdf7c3a89f3eea258c12411ae398'
            '91d19642868a3859a860fc1a32541141472b8af46d9d2fa6983dd41ec6e0497ca6397a836a0921ba000e26be2be5b8d52ae74b0c5c29b4b73e4f6bce67f9b60d')

prepare() {
  cd "${pkgname}-${_actual_ver}${_extra_ver}"

  patch -p1 -i ../0001-Temporarily-disable-previous-button-drop-shadow-draw.patch
}

build() {
  cd "${pkgname}-${_actual_ver}${_extra_ver}"

  export CFLAGS+=" -Wno-error"
  autoreconf -vfi
  ./configure --prefix=/usr --disable-static --disable-introspection
  make
}

package() {
  cd "${pkgname}-${_actual_ver}${_extra_ver}"

  make DESTDIR="${pkgdir}/" install
}
