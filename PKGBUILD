# Maintainer: Edgar Vincent <e-v@posteo.net>
_pkgname=waked
pkgname=${_pkgname}-git
pkgver=v0.1.1.r0.g05729fb
pkgrel=1
pkgdesc="Daemon to let other applications wake up the system"
url="https://gitlab.com/seath1/waked"
license=('GPL2')
arch=('aarch64' 'x86_64')
depends=(sdbus-cpp)
makedepends=(git cmake)
provides=('waked')
source=("git+https://gitlab.com/seath1/waked.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  cmake src
  make
}

package() {
  cd "$_pkgname"
  install -Dm755 waked "${pkgdir}"/usr/bin/waked
  install -Dm644 waked.service "${pkgdir}"/usr/lib/systemd/system/waked.service
  install -Dm644 de.seath.Waked.conf "${pkgdir}"/usr/share/dbus-1/system.d/de.seath.Waked.conf
}
