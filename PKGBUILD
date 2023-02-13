# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=kitchencalendar
pkgver=1.0.3
pkgrel=1
pkgdesc='Generate weekly calendar PDF files that can be hung up in the Kitchen'
arch=(x86_64)
url='https://github.com/xyproto/kitchencalendar'
source=("git+$url#commit=9e772cb426bc81c6acbd5b871682d4196f65a8a6") # tag: v1.0.3
license=(BSD)
makedepends=(git go)

b2sums=('SKIP')

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
