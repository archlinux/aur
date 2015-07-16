# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: josephgbr <rafael.f.f1 at gmail dot com>
# Contributor: TryA <tryagainprod at gmail dot com>
# Contributor: Jan de Groot <jgc at archlinux dot org>

_pkgbase=libnotify
pkgname=lib32-${_pkgbase}
pkgver=0.7.6
pkgrel=3
pkgdesc="Desktop notification library (32-bit)"
arch=('x86_64')
url="http://library.gnome.org/devel/notification-spec/"
license=('LGPL')
depends=('lib32-gdk-pixbuf2' "${_pkgbase}")
makedepends=('lib32-gtk3' 'gcc-multilib' 'gobject-introspection')
options=('!libtool')
source=("http://ftp.gnome.org/pub/GNOME/sources/${_pkgbase}/0.7/${_pkgbase}-${pkgver}.tar.xz")
sha512sums=('5d656ee7ee5caeb95aec4adb973795dc72fc620cd36b9fe3d4f910951945bd5df70ee1c422cd6aca9c38a9ba2760562e479fc8fb9269449924a5b24d762d03df')

build() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export LDFLAGS='-m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  ./configure --prefix=/usr --disable-static --libdir=/usr/lib32
  make
}

package() {
  make -C "${srcdir}/${_pkgbase}-${pkgver}" DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/"{bin,include,share}
}
