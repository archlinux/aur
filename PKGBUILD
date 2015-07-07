# Maintainer: Uwe Koloska <kolewu@koloro.de>

pkgname=libgcrypt11
pkgver=1.5.0
pkgrel=5
pkgdesc='gcrypt11 library (current maintained debian version with .so-version 11)'
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/libgcrypt/"
license=(GPLv2)

_debver=deb7u3
_deburl="http://ftp.debian.org/debian/pool/main/libg/libgcrypt11"

if [ "${CARCH}" = "x86_64" ] ; then
  _arch="amd64"
  _arch2="x86_64"
  _sover=11.7.0
else
  _arch="i386"
  _arch2="i386"
  _sover=11.7.0
fi

source=()
md5sums_i686=('36e8b3e5c2a361aae823bd5753f84bec')
md5sums_x86_64=('1f001aec0c9ec9fa785122fedb72bf7f')
source_x86_64=(${_deburl}/libgcrypt11_${pkgver}-${pkgrel}+${_debver}_amd64.deb)
source_i686=(${_deburl}/libgcrypt11_${pkgver}-${pkgrel}+${_debver}_i386.deb)

package() {
  ar vx $srcdir/${pkgname}_${pkgver}-${pkgrel}+${_debver}_${_arch}.deb
  if [ "${CARCH}" = "x86_64" ]; then
    tar xvf $srcdir/data.tar.gz
  else
    tar xzf $srcdir/data.tar.gz
  fi
  install -Dm755 $srcdir/lib/${_arch2}-linux-gnu/libgcrypt.so.${_sover} $pkgdir/usr/lib/libgcrypt.so.${_sover}
  ln -s libgcrypt.so.${_sover} $pkgdir/usr/lib/libgcrypt.so.11
}
