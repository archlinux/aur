# Maintainer: Augustin deMayo <gus.demayo@gmail.com>

pkgname=jammr
pkgver=1.2.8
pkgrel=1
pkgdesc="jammr lets you play with musicians over the internet"
arch=("i686" "x86_64")
url="https://www.jammr.net/"
license=("GPL2")
depends=("libvorbis" "libogg" "libstdc++296" "portaudio" "portmidi" "qt5-base")
makedepends=("qt5-base" "portmidi")
options=("!emptydirs")
source=("https://github.com/wahjam/wahjam/archive/${pkgname}-${pkgver}.tar.gz")
sha512sums=('1172681298275118bd58a469d57df07fb080d43b7e7bc6712a1061ae1d21520b6e9cb99e6671b6590f3721a3c8aaecb5c1869a37e92a4a64a161bb3289657ce0')

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
