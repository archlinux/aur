# Maintainer: Luca P <meti at lplab.net>
# Contributor: Ammann Max <maximilian.ammann@googlemail.com>

pkgname=golden-cheetah-dev
pkgver=3.5
pkgrel=191208
_devversion=RC2X
pkgdesc="Cycling Power Analysis Software. Development version."
arch=('i686' 'x86_64')
url="http://www.goldencheetah.org/"
license=('GPL')
makedepends=(bison flex 'gcc' 'make' 'qt5-tools' )
depends=('qt5-base' 'qt5-svg' qt5-location qt5-declarative qt5-webchannel qt5-sensors qt5-serialport qt5-webkit qt5-multimedia qt5-script qt5-connectivity qt5-charts vlc 'libical')
optdepends=('vlc' 'qwtplot3d-svn' 'srmio' 'libftd2xx' 'libkml' 'libusb-compat' 'libsamplerate')
options=('!strip' '!buildflags' 'staticlibs')
source=(https://github.com/GoldenCheetah/GoldenCheetah/archive/V$pkgver-$_devversion.tar.gz
gcconfig.pri GoldenCheetah.desktop gc.png)
md5sums=('aa3ba5daeee0a0ef0dfb790d62c0a325'
         'c9046d48dcff232fcdd6b04ab77db6db'
         '5a83da03adf4b4ea14ec459061699c0c'
         'e1fb382b4a7316da1ffd435e45e50c4a')

build() {
  cd "${srcdir}/GoldenCheetah-$pkgver-$_devversion"

  cd "qwt/"
  cp qwtconfig.pri.in qwtconfig.pri
  qmake-qt5 QMAKE_DEFAULT_INCDIRS=
  make

  cd "../src/"
  cp $srcdir/gcconfig.pri gcconfig.pri
  qmake-qt5 QMAKE_LRELEASE=/usr/bin/lrelease-qt5 QMAKE_DEFAULT_INCDIRS=
  make
}

package() {
  mkdir -p "$pkgdir/usr/bin/"
  cp "${srcdir}/GoldenCheetah-$pkgver-$_devversion/src/GoldenCheetah" "$pkgdir/usr/bin/"
  mkdir -p "$pkgdir/usr/lib/udev/rules.d/"
  mkdir -p "$pkgdir/usr/share/applications/"
  cp "${srcdir}/GoldenCheetah.desktop" "$pkgdir/usr/share/applications/"
  mkdir -p "$pkgdir/usr/share/pixmaps/"
  cp "${srcdir}/gc.png" "$pkgdir/usr/share/pixmaps/"
}

