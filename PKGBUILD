# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Maintainer: Michael Healy <horsemanoffaith@gmail.com>
# Original Maintainer: György Balló <ballogy@freestart.hu>
# Contributor: thn81 <root@scrat>

# vercheck-pkgbuild: auto
# vercheck-ubuntu: name=${pkgname}, repo=zesty
# vercheck-launchpad: name=${pkgname}

pkgname=ido-ubuntu
_actual_ver=13.10.0
_extra_ver=+17.04.20161028
pkgver=${_actual_ver}${_extra_ver/\+/.}
pkgrel=1
pkgdesc="Widgets and other objects used for indicators"
arch=(i686 x86_64)
url="https://launchpad.net/ido"
license=(LGPL)
depends=(gtk3)
makedepends=(gobject-introspection gtk-doc vala xorg-util-macros)
groups=(unity)
source=("https://launchpad.net/ubuntu/+archive/primary/+files/ido_${_actual_ver}${_extra_ver}.orig.tar.gz"
        0001-Temporarily-disable-previous-button-drop-shadow-draw.patch)
sha512sums=('867157c9e316eb5ed69ebdf1017ed86990aabf7a885ba26acab36782f0f27e10b4621a7db15ac90335e808022490a98560d5ff443e6f697c578eed5868385ebd'
            '91d19642868a3859a860fc1a32541141472b8af46d9d2fa6983dd41ec6e0497ca6397a836a0921ba000e26be2be5b8d52ae74b0c5c29b4b73e4f6bce67f9b60d')

prepare() {
    
    patch -p1 -i ../0001-Temporarily-disable-previous-button-drop-shadow-draw.patch
}

build() {
    
    export CFLAGS+=" -Wno-error"
    autoreconf -vfi
    ./configure --prefix=/usr --disable-static --disable-introspection
    make
}

package() {
    
    make DESTDIR="${pkgdir}/" install
}
