# Maintainer: Gus deMayo <gus@thegusproject.xyz>

pkgname=jammr
pkgver=1.2.6
pkgrel=1
pkgdesc="jammr lets you play with musicians over the internet"
arch=("i686" "x86_64")
url="https://www.jammr.net/"
license=("GPL2")
depends=("libvorbis" "libogg" "libstdc++296" "portaudio" "portmidi" "qt5-base")
makedepends=("qt5-base" "portmidi")
options=("!emptydirs")
source=("https://codeload.github.com/stefanha/wahjam/tar.gz/${pkgname}-${pkgver}")
md5sums=("380874966a852279ac0403dee38262f2")

build() {
  cd wahjam-jammr-${pkgver}

  qmake-qt5 QTCLIENT_TARGET=jammr \
                 JAMMR_API_URL="https://jammr.net/api/" \
                 JAMMR_REGISTER_URL="https://jammr.net/accounts/register/" \
                 JAMMR_UPGRADE_URL="https://jammr.net/pricing.html" \
                 JAMMR_UPDATE_URL="https://jammr.net/static/latest-linux.txt" \
                 JAMMR_DOWNLOAD_URL="https://jammr.net/download.html" \
                 VERSION=${pkgver} \
                 APPNAME=jammr \
                 ORGNAME=jammr \
                 ORGDOMAIN=jammr.net \
                 USE_LIBPORTTIME=1
  make
}

package() {
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/icons
  mkdir -p $pkgdir/usr/share/applications
  cd $srcdir/wahjam-jammr-${pkgver}
  cp -r qtclient/jammr $pkgdir/usr/bin/jammr
  cp -r debian/jammr.svg $pkgdir/usr/share/icons
  cp -r debian/jammr.desktop $pkgdir/usr/share/applications
  chmod -R 755 $pkgdir/usr/bin/jammr
  chmod -R 755 $pkgdir/usr/share/applications/jammr.desktop
}