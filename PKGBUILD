# Maintainer: Jason Lenz <Jason@Lenzplace.org>
pkgname=sleepyhead
pkgver=1.0.0
subver="beta-2"
pkgrel=1
pkgdesc="Open-source, cross platform, sleep tracking software with a focus on monitoring CPAP treatment."
arch=('i686' 'x86_64')
url="http://sleepyhead.jedimark.net"
license=('GPL')
depends=(
  'qt5-base'
  'qt5-serialport'
  'qt5-webkit'
  'glu'
)
makedepends=('git')
provides=("$pkgname")
conflicts=('sleepyhead-git')

source=(
  "${pkgname}-${pkgver}-${subver}.tar.bz2::https://gitlab.com/sleepyhead/sleepyhead-code/repository/archive.tar.bz2?ref=${pkgver}-${subver}"
  'moduleupdates.patch'
)

sha256sums=(
  db6152a47df69c5cf85a75171d64c2208a953d838ea5c974c2399e8d7cc94353 #sleepyhead-code-1.0.0-beta-2.tar.bz2
  af1390195fc4a5f2aa0cced24b1ce1a629dbd608a40d10dc319cfcbd959bec02 #moduleupdates.patch
)

prepare() {
  mv sleepyhead-code* sleepyhead-code
  cd sleepyhead-code
  patch -Np1 -i "$srcdir/moduleupdates.patch"
}

build() {
  cd sleepyhead-code
  ./configure
  make
}

package() {
  install -D "$srcdir/sleepyhead-code/sleepyhead/SleepyHead" "$pkgdir/usr/bin/SleepyHead"
}

# vim:set ts=2 sw=2 et:
