# Maintainer: Cody P Schafer <archlinux at codyps.com>
_bpn=dbus-test-runner
pkgname=${_bpn}-bzr
pkgver=r39
pkgrel=1
pkgdesc="A small little utility to run a couple of executables under a new DBus session for testing"
arch=(x86_64 )
url="https://launchpad.net/dbus-test-runner"
license=('GPLv3')
groups=()
depends=()
makedepends=(bzr gnome-common)
provides=(${_bpn})
conflicts=(${_bpn})
replaces=()
backup=()
options=(!emptydirs)
install=
source=($pkgname::bzr+http://bazaar.launchpad.net/~indicator-applet-developers/$_bpn/trunk)
md5sums=(SKIP)

pkgver() {
  cd "$pkgname"
  printf "r%s" "$(bzr revno)"
}

build() {
  cd "$pkgname"
  export CFLAGS="${CFLAGS:-} -Wno-error=deprecated -Wno-error=deprecated-declarations"
  ./autogen.sh
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
