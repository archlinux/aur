# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=kitchencalendar
pkgver=1.0.5
pkgrel=1
pkgdesc='Generate weekly calendars that can be printed out and hung up in the kitchen'
arch=(x86_64)
url='https://github.com/xyproto/kitchencalendar'
source=("git+$url#tag=v$pkgver")
license=(BSD)
makedepends=(git go)
b2sums=('e682f0780443eaeb2513c867752766aff19b97b6fc4b465e1a8c92f6d72f08970434f3b793782398491f57e3d0b7100eb6fa6b90d1b2c39a9a8d07471c3f66a4')

build() {
  cd $pkgname
  go build -v -mod=vendor -buildmode=pie -trimpath -ldflags="-s -w -extldflags \"${LDFLAGS}\"" -tags nb_NO -o kitchencalendar_no
  go build -v -mod=vendor -buildmode=pie -trimpath -ldflags="-s -w -extldflags \"${LDFLAGS}\"" -tags en_US -o kitchencalendar_us
}

package() {
  cd $pkgname
  install -Dm755 kitchencalendar_no "$pkgdir/usr/bin/kitchencalendar_no"
  install -Dm755 kitchencalendar_us "$pkgdir/usr/bin/kitchencalendar_us"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
