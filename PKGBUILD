# Maintainer: Jason Go <jasongo@jasongo.net>

pkgname="lib32-libgnome-keyring-bin"
pkgver=3.12.0_32_43
_pkgver=( ${pkgver//_/ } )
_upver="${_pkgver[0]}"
_buildver="${_pkgver[1]}"
_fcver="${_pkgver[2]}"
pkgrel=1
pkgdesc='GNOME keyring client library (deprecated, 32-bit)'
arch=('x86_64')
url='https://gitlab.gnome.org/Archive/libgnome-keyring'
license=('GPL-2.0-or-later' 'LGPL-2.1-or-later')
depends=(
  'lib32-dbus'
  'lib32-glib2'
  'lib32-glibc'
  'lib32-libgcrypt'
)
provides=(
  'lib32-libgnome-keyring'
  'lib32-libgnome-keyring0'
  'libgnome-keyring.so=0'
)
conflicts=(
  'lib32-libgnome-keyring'
  'lib32-libgnome-keyring0'
)
options=(staticlibs !buildflags !makeflags !strip !debug)
source=("https://kojipkgs.fedoraproject.org//packages/libgnome-keyring/$_upver/$_buildver.fc$_fcver/i686/libgnome-keyring-$_upver-$_buildver.fc$_fcver.i686.rpm")
sha256sums=('a33eec012200989be63d7cfecfd590f58337e6a9639557b1284b1ab581d06df9')

package() {
  mv "$srcdir/usr" "$pkgdir"
  mv "$pkgdir/usr/lib" "$pkgdir/usr/lib32"
  mv "$pkgdir/usr/share/doc/libgnome-keyring" "$pkgdir/usr/share/doc/$pkgname"
  mv "$pkgdir/usr/share/licenses/libgnome-keyring" "$pkgdir/usr/share/licenses/$pkgname"
  rm -rf "$pkgdir/usr/share/locale"
  rm -rf "$pkgdir/usr/lib32/.build-id"
}
