# Maintainer: Uwe Koloska <kolewu@koloro.de>

pkgname=libgcrypt11
pkgver=1.5.0
_sover=11.7.0
pkgrel=5
pkgdesc='gcrypt11 library (current maintained debian version with .so-version 11)'
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/libgcrypt/"
license=(GPL2)
depends=(libgpg-error)
provides=(libgcrypt15)
conflicts=(libgcrypt15)

_debver=deb7u4
_deburl="http://security.debian.org/debian-security/pool/updates/main/libg/libgcrypt11"

if [ "${CARCH}" = "x86_64" ] ; then
  _arch="amd64"
  _arch2="x86_64"
else
  _arch="i386"
  _arch2="i386"
fi

source=()
source_x86_64=(${_deburl}/libgcrypt11_${pkgver}-${pkgrel}+${_debver}_amd64.deb)
source_i686=(${_deburl}/libgcrypt11_${pkgver}-${pkgrel}+${_debver}_i386.deb)
md5sums_i686=('b31a8510f6414732ae530a3718a768e2')
md5sums_x86_64=('05f7d141c15d49ee29dfd28503ec1f63')

package() {
  ar vx $srcdir/${pkgname}_${pkgver}-${pkgrel}+${_debver}_${_arch}.deb
  tar xvf $srcdir/data.tar.gz
  install -Dm755 $srcdir/lib/${_arch2}-linux-gnu/libgcrypt.so.${_sover} $pkgdir/usr/lib/libgcrypt.so.${_sover}
  ln -s libgcrypt.so.${_sover} $pkgdir/usr/lib/libgcrypt.so.11
}
