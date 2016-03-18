# Maintainer: Uwe Koloska <kolewu@koloro.de>
# Contributor: Sairon Istyar <saironiq@gmail.com>

pkgname=libgnutls26
pkgver=2.12.20
_sover=26.22.4
pkgrel=8
pkgdesc='gnutls26 library (current maintained debian version with .so-version 26)'
arch=('i686' 'x86_64')
url="http://www.gnutls.org/"
license=(LGPL3)
depends=(libgcrypt11 libtasn1-3 p11-kit)

_debver=deb7u5
_deburl="http://security.debian.org/debian-security/pool/updates/main/g/gnutls26/"

if [ "${CARCH}" = "x86_64" ] ; then
  _arch="amd64"
  _arch2="x86_64"
else
  _arch="i386"
  _arch2="i386"
fi

source=()
source_i686=(${_deburl}/${pkgname}_${pkgver}-${pkgrel}+${_debver}_i386.deb)
source_x86_64=(${_deburl}/${pkgname}_${pkgver}-${pkgrel}+${_debver}_amd64.deb)
md5sums_i686=('08380f92802253f935415bf011f04035')
md5sums_x86_64=('2b2555405c406153acb083e0157fc577')

package() {
  ar vx $srcdir/${pkgname}_${pkgver}-${pkgrel}+${_debver}_${_arch}.deb
  tar xvf $srcdir/data.tar.gz
  install -d $pkgdir/usr/lib/
  cp -a $srcdir/usr/lib/${_arch2}-linux-gnu/libgnutls.so* $pkgdir/usr/lib/
  install -d $pkgdir/usr/share/locale/
  cp -a $srcdir/usr/share/locale/* $pkgdir/usr/share/locale/
}
