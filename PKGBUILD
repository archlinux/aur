# Maintainer: Padfoot <padfoot at exemail dot com dot au>
# Contributor: Mr_Men <tetcheve at gmail dot com>
# Contributor: Hasan Gormus aka hsngrms <hsngrms at yandex dot com>
# Contributor: uwinkelvos <uwinkelvos at gmx dot de>

pkgname=nvidiabl
pkgver=0.88
pkgrel=2
pkgdesc="Backlight driver for NVidia graphics adapters"

arch=('x86_64' 
      'i686')
url="https://github.com/guillaumezin/nvidiabl"
license=('GPL')

makedepends=('linux-headers'
             'unzip')
optdepends=('nvidiablctl: adjust backlight easily')
conflicts=(nvidia-bl)

install=nvidiabl.install
source=(https://github.com/guillaumezin/nvidiabl/archive/master.zip 
        nvidiabl-module.c.patch)
md5sums=('5fdda33fedcb78320c1581e84b395d39'
         '20fb3f129307b3c7289610c98b94520e')

prepare() {
  cd "$srcdir/nvidiabl-master/"
  patch -p1 -i $srcdir/nvidiabl-module.c.patch
}

build() {
  cd "$srcdir/nvidiabl-master/"
  make
}

package() {
  cd "$srcdir/nvidiabl-master/"
  _extramodules="extramodules-$(uname -r | cut -f-2 -d'.')-$(uname -r|sed -e 's/.*-//g')"
  _MODPATH="${pkgdir}/usr/lib/modules/${_extramodules}/"
  install -d $_MODPATH
  install -m 644 -c nvidiabl.ko _$MODPATH
}
