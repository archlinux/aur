# Maintainer: Jason Go <jasongo@jasongo.net>

pkgname="lib32-libgnome-keyring-bin"
pkgver=3.12.0_116.85
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
options=(!buildflags !makeflags !strip !debug)
source=(
  "https://tumbleweed.opensuse.org/repositories/GNOME:/Next/openSUSE_Factory/x86_64/libgnome-keyring0-32bit-${pkgver//_/-}.x86_64.rpm"
  "https://tumbleweed.opensuse.org/repositories/GNOME:/Next/openSUSE_Factory/src/libgnome-keyring-${pkgver//_/-}.src.rpm"
)
sha256sums=('cb2fa2234e039904fcda8f4c0322fd4d4c90487a3c271b5a94c63ca720252bd7'
            '0291a08c25a90fa03ca75b66127d73bc4edb9b40da05a0068f293f69a93467aa')

package() {
  # Extract the source to get the license and docs
  bsdtar -xf "$srcdir/libgnome-keyring-${pkgver%_*}.tar.xz"

  mv "$srcdir/usr" "$pkgdir"
  mv "$pkgdir/usr/lib" "$pkgdir/usr/lib32"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/libgnome-keyring-${pkgver%_*}/COPYING"
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" "$srcdir/libgnome-keyring-${pkgver%_*}/"{AUTHORS,ChangeLog,HACKING,NEWS,README}
}
