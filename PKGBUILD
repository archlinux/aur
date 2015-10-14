# Maintainer: maz-1 < ohmygod19993 at gmail dot com >
pkgname=xsystem35
pkgver=1.7.3
_pkgrev=pre5
pkgrel=1
pkgdesc="A free implementation of System 3.5, a games engine created by Alice Soft."
arch=(i686 x86_64)
url="http://8ne.sakura.ne.jp:20008/chika/unitbase/xsys35/"
license=('GPL')
depends=(freetype2 gtk2 alsa-lib fontconfig libvorbis libpng libjpeg)
makedepends=(gcc-fortran)
source=(http://ftp.debian.org/debian/pool/main/x/xsystem35/xsystem35_${pkgver}-${_pkgrev}.orig.tar.gz
        01_change_conflict_define.patch
        02_use_utf8.patch
        03_remove_libltdl.patch)
md5sums=('853aaa90f1b1c46a7a9eab4672cd9a27'
         '2d7987f5cb1216a00591ec50fee3ee9d'
         'c7a3255d9a79563cb34d8dcb8858417f'
         '403075825ae1eae1e389629d1cec2999')

prepare () {
  cd "$srcdir/${pkgname}-${pkgver}-${_pkgrev}"
  patch -p1 < "$srcdir/01_change_conflict_define.patch"
  patch -p1 < "$srcdir/02_use_utf8.patch"
  patch -p1 < "$srcdir/03_remove_libltdl.patch"
}

build() {
  cd "$srcdir/${pkgname}-${pkgver}-${_pkgrev}"

  ./configure LDFLAGS="$(LDFLAGS) -lX11 -lltdl" --prefix=/usr \
		--enable-audio=default,alsa,oss,esd \
		--enable-cdrom=default,linux,mp3 \
		--enable-midi=extp,raw,seq
		
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}-${_pkgrev}"

  make DESTDIR="${pkgdir}" install
}

