# Maintainer: Raansu <gero3977@gmail.com>

# PKGBUILD script initially copied from https://aur.archlinux.org/packages/libgnutls26/
# Contributor: Uwe Koloska <kolewu@koloro.de>
# Contributor: Sairon Istyar <saironiq@gmail.com>

pkgname=lib32-gnutls26
pkgver=2.12.20
_sover=26.22.4
pkgrel=8
pkgdesc='gnutls26 library (current maintained debian version with 
.so-version 26) This is the Multilib package.'
arch=('x86_64')
url="http://www.gnutls.org/"
license=('LGPL3')
depends=('libgcrypt15' 'libtasn1-3' 'p11-kit')
provides=('lib32-gnutls26')
conflicts=('lib32-gnutls26')

_debver=deb7u5
_debpkgname=libgnutls26
_deburl="http://security.debian.org/debian-security/pool/updates/main/g/gnutls26/"

if [ "${CARCH}" = "x86_64" ] ; then
  _arch="amd64"
  _arch2="x86_64"
  _lib32="i386"
else
  _arch="i386"
  _arch2="i386"
fi

source=(${_deburl}/${_debpkgname}_${pkgver}-${pkgrel}+${_debver}_i386.deb)
md5sums=('08380f92802253f935415bf011f04035')

package() {
  if [ "${_arch2}" = "i386" ] ; then
   echo "Install failed, this package is ment for multilib x86_64 systems 64bit."
  fi
  ar vx $srcdir/${_debpkgname}_${pkgver}-${pkgrel}+${_debver}_${_lib32}.deb
  tar xvf $srcdir/data.tar.gz
  install -d $pkgdir/usr/lib32/
  cp -a $srcdir/usr/lib/${_lib32}-linux-gnu/* $pkgdir/usr/lib32/
}
