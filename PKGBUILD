# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>

pkgname=libcap-ng-minimal-git
pkgver=0.8.2
pkgrel=1
pkgdesc='Library making programming with POSIX capabilities easier than traditional libcap'
url='https://people.redhat.com/sgrubb/libcap-ng/'
arch=('x86_64')
license=('LGPL2.1')
depends=('glibc')
provides=('libcap-ng.so' 'libdrop_ambient.so' 'libcap-ng')
conflicts=(libcap-ng)
source=(git+https://github.com/stevegrubb/libcap-ng.git)
sha512sums=('SKIP')

pkgver() {
  cd libcap-ng
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd libcap-ng

  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --enable-static=no \
    --without-python \
    --without-debug \
    --without-warn
  make
}

#check() {
#  cd libcap-ng
#  make check
#}

package() {
  cd libcap-ng
  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
