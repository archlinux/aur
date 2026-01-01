# Maintainer: ldev <ldev at ldev dot eu dot org>

pkgname=handoff-git
pkgver=r1.be3d40b
pkgrel=1
pkgdesc='Daemon for seamless audio handoff between Linux and Apple using AirPods.'
arch=(x86_64)
url=https://github.com/xatuke/handoff
license=(MIT)
depends=(dbus bluez-utils)
makedepends=(qt6-base qt6-connectivity cmake make)
source=("handoff@.service" "$pkgname::git+$url.git")
md5sums=('SKIP' 'SKIP')

pkgver()  {
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$pkgname"
  mkdir -p build
  cd build
  cmake ..
  make
}

package() {
  install -Dm0644 "handoff@.service" "$pkgdir/usr/lib/systemd/user/handoff@.service"
  install -Dm0755 "$pkgname/build/airpods-handoff" "$pkgdir/usr/bin/airpods-handoff"
}
