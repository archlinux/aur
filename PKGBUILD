# Contributor: Andreas Baumann <mail at andreas baumann dot cc>

pkgname=wozzle
pkgver=r71.96330ba
pkgrel=2
pkgdesc="A woz disk image tool"
arch=('x86_64')
url="https://github.com/JorjBauer/wozzle"
license=('MIT')
depends=()
makedepends=()
source=(
  "${pkgname}::git+https://github.com/JorjBauer/wozzle.git"
  "wozzle-arpa-inet.patch"
)
sha256sums=('SKIP'
            '6d6036ac35ed0b5cfc3b1c3673676c7c523945ab2e7065b7581ad1a2d66ca55f')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgname}"
  patch -p1 < "$srcdir"/wozzle-arpa-inet.patch
}

build() {
  cd "${pkgname}"
  make
}

package() {
  cd "${pkgname}"
  install -D -m 755 "wozzle" "$pkgdir/usr/bin/wozzle"
  install -D -m 755 "wozit" "$pkgdir/usr/bin/wozit"
  install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
