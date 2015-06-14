# Maintainer: Jason Lenz <Jason@Lenzplace.org>
_pkgname=sleepyhead
pkgname=$_pkgname-git
pkgver=0.9.8.1.ga7a9c4f
pkgrel=2
pkgdesc="Open-source, cross platform, sleep tracking software with a focus on monitoring CPAP treatment."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/sleepyhead"
license=('GPL')
depends=(
  'qt5-base'
  'qt5-serialport'
  'qt5-webkit'
  'glu'
)
makedepends=('git')
provides=()
conflicts=('sleepyhead')
source=(
  "git://git.code.sf.net/p/sleepyhead/code"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd code
  _major=$(sed -rn 's/.*major_version = ([0-9]+).*/\1/p' < sleepyhead/version.h)
  _minor=$(sed -rn 's/.*minor_version = ([0-9]+).*/\1/p' < sleepyhead/version.h)
  _rev=$(sed -rn 's/.*revision_number = ([0-9]+).*/\1/p' < sleepyhead/version.h)
  _build=$(cat sleepyhead/scripts/build_number)
  _gitversion=$(git rev-parse --short HEAD)
  echo $_major.$_minor.$_rev.$_build.g$_gitversion
}

build() {
  cd code
  ./configure
  make
}

package() {
  install -D "$srcdir/code/sleepyhead/SleepyHead" "$pkgdir/usr/bin/SleepyHead"
}

# vim:set ts=2 sw=2 et:
