# Maintainer:
# Contributor: Thomas Gatzweiler <thomas.gatzweiler@gmail.com>

_pkgname="qlog"
pkgname="$_pkgname-git"
pkgver=0.45.0.r0.g6f90e01
pkgrel=1
pkgdesc="Amateur radio logbook software"
url="https://github.com/foldynl/QLog"
license=('GPL-3.0-or-later')
arch=("x86_64" "i686")

depends=(
  'hamlib'
  'libglvnd'
  'qt6-charts'
  'qt6-declarative'
  'qt6-positioning'
  'qt6-serialport'
  'qt6-webchannel'
  'qt6-webengine'
  'qt6-websockets'
  'qtkeychain-qt6'
  'sqlite'
)
makedepends=(
  'git'
)
optdepends=(
  'org.freedesktop.secrets: keyring/password support'
)

provides=("$_pkgname=${pkgver%%.g*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgsrc"
  qmake6 PREFIX="$pkgdir/usr" QLog.pro
  make
}

package() {
  cd "$_pkgsrc"
  make install
}
