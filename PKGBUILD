# Maintainer: Uwe Koloska <kolewu@koloro.de>
# Contributor: Sindre Føring Devik <sindre.devik@gmail.com>

pkgname=libtasn1-3
pkgver=2.13
_sover=3.1.16
pkgrel=2
pkgdesc='tasn1-3 library (shared objects)'
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/libtasn1/"
license=(LGPL2.1)
depends=(glibc)

_debver=deb7u2
_deburl="http://security.debian.org/debian-security/pool/updates/main/libt/libtasn1-3"

if [ "${CARCH}" = "x86_64" ] ; then
  _arch1="amd64"
  _arch2="x86_64"
else
  _arch1="i386"
  _arch2="i386"
fi

source=()
source_i686=("${_deburl}/libtasn1-3_${pkgver}-${pkgrel}+${_debver}_i386.deb")
source_x86_64=("${_deburl}/libtasn1-3_${pkgver}-${pkgrel}+${_debver}_amd64.deb")
md5sums_i686=('0ace24882b82b0264e5e7af689a15fb7')
md5sums_x86_64=('bdc85decdb298bb1b2db74f938062428')

package() {
	cd $srcdir
	ar vx libtasn1-3_${pkgver}-${pkgrel}+${_debver}_${_arch1}.deb
	tar xzvf data.tar.gz
	install -Dm755 usr/lib/${_arch2}-linux-gnu/libtasn1.so.${_sover} $pkgdir/usr/lib/libtasn1.so.${_sover}
	ln -s libtasn1.so.${_sover} $pkgdir/usr/lib/libtasn1.so.3
}
