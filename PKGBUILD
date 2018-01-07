# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Darwin Bautista <djclue917@gmail.com>
# Contributor: Mark Lee <mark@markelee.com>

pkgname=linphone
pkgver=3.12.0
pkgrel=1
pkgdesc="A Voice-over-IP phone"
arch=('x86_64')
url="http://www.linphone.org"
license=('GPL')
depends=('alsa-lib' 'ffmpeg' 'gtk2' 'speex' 'libv4l' 'libglade' 'v4l-utils'
	 'libpulse' 'libxv' 'mediastreamer' 'ortp' 'bzrtp' 'bcg729' 'libsoup'
	 'belle-sip' 'libnotify' 'libldap')
makedepends=('pkg-config' 'perl-xml-parser' 'intltool' 'sgml-common' 'bcunit')
optdepends=('pulseaudio')
options=('!emptydirs')
install=linphone.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/BelledonneCommunications/linphone/archive/$pkgver.tar.gz")
sha256sums=('60fb1e5d25823fecc7ce1955ce7e886e013118a184df1965d1877ffe6cc171b7')

build() {
  cd $pkgname-$pkgver
  export CFLAGS="$CFLAGS -DMS2_GIT_VERSION="'"unknown"'
  touch coreapi/gitversion.h
  ./autogen.sh
  ./configure --prefix=/usr --disable-static --enable-ipv6 --enable-video \
	--enable-alsa --enable-pulseaudio --disable-artsc --disable-strict \
	--libexecdir=/usr/lib/$pkgname \
	--enable-external-mediastreamer \
	--enable-external-ortp \
	--enable-zrtp \
	--enable-ldap
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
