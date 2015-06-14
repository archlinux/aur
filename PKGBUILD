# Maintainer: Jason Lenz <Jason@Lenzplace.org>
pkgname=sleepyhead
pkgver=0.9.8
pkgrel=1
pkgdesc="Open-source, cross platform, sleep tracking software with a focus on monitoring CPAP treatment."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/sleepyhead"
license=('GPL')
depends=(
  'qt5-base'
  'qt5-serialport'
  'qt5-webkit'
)
makedepends=('git')
provides=("$pkgname")
conflicts=('sleepyhead-git')

source=(
  "git://git.code.sf.net/p/sleepyhead/code#tag=0.9.8-0"
  'moduleupdates.patch'
)

sha256sums=(
  'SKIP'
  af1390195fc4a5f2aa0cced24b1ce1a629dbd608a40d10dc319cfcbd959bec02
)

build() {
  cd code
  patch -Np1 -i "$srcdir/moduleupdates.patch"
  ./configure
  make
}

package() {
  install -D "$srcdir/code/sleepyhead/SleepyHead" "$pkgdir/usr/bin/SleepyHead"
}

# vim:set ts=2 sw=2 et:
