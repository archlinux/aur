# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=kitchencalendar
pkgver=1.0.2
pkgrel=1
pkgdesc='Generate weekly calendar PDF files that can be hung up in the Kitchen'
arch=(x86_64)
url='https://github.com/xyproto/kitchencalendar'
license=(BSD)
makedepends=(git go)
source=("git+$url#commit=f9961370ca9c7cdbeb6b25e42a14b4d0d2854b5f") # tag: v1.0.2
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
