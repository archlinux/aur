# Maintainer: Uwe Koloska <kolewu@koloro.de>
# Contributor: Sairon Istyar <saironiq@gmail.com>

pkgname=libgnutls26
pkgver=2.12.23
_sover=26.22.6
pkgrel=18
pkgdesc='gnutls26 library (shared objects)'
arch=('i686' 'x86_64')
url="http://www.gnutls.org/"
license=(LGPLv3)

if [ "${CARCH}" = "x86_64" ] ; then
  _arch="amd64"
  _arch2="x86_64"
  source=(http://ftp.debian.org/debian/pool/main/g/gnutls26/${pkgname}_${pkgver}-${pkgrel}_amd64.deb)
  md5sums=('781c367990e74fb756611748a2ef4a0b')
else
  _arch="i386"
  _arch2="i386"
  source=(http://ftp.debian.org/debian/pool/main/g/gnutls26/${pkgname}_${pkgver}-${pkgrel}_i386.deb)
  md5sums=('4f36c0f9ca711af91164db3ecdfdb7b2')
fi

package() {
  ar vx $srcdir/libgnutls26_${pkgver}-${pkgrel}_${_arch}.deb
  tar xvf $srcdir/data.tar.xz
  install -Dm755 $srcdir/usr/lib/${_arch2}-linux-gnu/libgnutls.so.${_sover} $pkgdir/usr/lib/libgnutls.so.${_sover}
  ln -s libgnutls.so.${_sover} $pkgdir/usr/lib/libgnutls.so.26
  install -Dm755 $srcdir/usr/lib/${_arch2}-linux-gnu/libgnutls-extra.so.${_sover} $pkgdir/usr/lib/libgnutls-extra.so.${_sover}
  ln -s libgnutls-extra.so.${_sover} $pkgdir/usr/lib/libgnutls-extra.so.26
}
