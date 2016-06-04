# Maintainer: Aleksey Filippov <sarum9in@gmail.com>

pkgname=ip-wait-online
pkgver=3.dfb656f
pkgrel=1
pkgdesc="Wait for interface to be online using iproute2 check"
arch=('x86_64' 'i686')
url="https://github.com/sarum9in/ip-wait-online"
license=('GPL')
makedepends=('go')
options=('!strip' '!emptydirs')
source=("git+https://github.com/sarum9in/ip-wait-online.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$pkgname"

  go build
}

package() {
  cd "$pkgname"

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "ip-wait-online@.service" "$pkgdir/usr/lib/systemd/system/ip-wait-online@.service"
  #install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
