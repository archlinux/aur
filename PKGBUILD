# $Id: PKGBUILD,v2.1 2015/01/02 22:24:36 wh Exp $
# Maintainer: nisk1 <esqueleto_bajo[it_looks_like_a_snail]outlook[dot]com>

# Uncomment any of below lines to build additional plugins:
#_build_vlc="yes"
#_build_gstreamer="yes"
#_build_audacious="yes"

pkgname=asap
pkgver=3.2.0
pkgrel=3
pkgdesc="Another Slight Atari Player - library and players for 8-bit Atari music format"
url="http://asap.sourceforge.net"
arch=('i686' 'x86_64')
license=('GPL')
depends=(glibc)
options=(staticlibs)
source=("http://downloads.sourceforge.net/asap/${pkgname}-${pkgver}.tar.gz")
sha256sums=('a246f071794bc8319509358c328bfab6446f6defd614a3600757280a8757431f')

if [[ "$_build_vlc" = "yes" ]]; then
  makedepends+=('vlc')
fi 
if [[ "$_build_gstreamer" = "yes" ]]; then
  makedepends+=('gstreamer')
fi 
if [[ "$_build_audacious" = "yes" ]]; then
  makedepends+=('audacious')
fi

build() {
	cd $srcdir/$pkgname-$pkgver/
	make 

	if [[ "$_build_vlc" = "yes" ]]; then
		make asap-vlc
	fi
	if [[ "$_build_gstreamer" = "yes" ]]; then
		make asap-gstreamer
	fi
	if [[ "$_build_audacious" = "yes" ]]; then
		make asap-audacious
	fi 
}

package() {
	cd $srcdir/$pkgname-$pkgver/
	make DESTDIR="${pkgdir}" prefix="/usr" install-asapconv install
	
	if [[ "$_build_vlc" = "yes" ]]; then
		make DESTDIR="${pkgdir}" prefix="/usr" install-vlc
	fi
	if [[ "$_build_gstreamer" = "yes" ]]; then
		make DESTDIR="${pkgdir}" prefix="/usr" install-gstreamer
	fi
	if [[ "$_build_audacious" = "yes" ]]; then
		make DESTDIR="${pkgdir}" prefix="/usr" install-audacious
	fi
}

