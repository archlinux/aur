# Maintainer: Pieter Lexis <pieter+AUR@plexis.eu>

pkgname=envy
pkgver=0.1.0
pkgrel=1
pkgdesc="Shell helper that automatically sets and unsets environment variables"
arch=('i686' 'x86_64')
options=('!strip' '!emptydirs')
url="https://github.com/wojas/envy"
license=('MIT')
depends=()
makedepends=('go')
source=(https://github.com/wojas/envy/archive/v${pkgver}.tar.gz
        $pkgname.sh)
sha256sums=('f679cd32168db3d748464383f41a6a362124660bc8c230d6314de2f852326812'
            'b2581587b19848f0d3d6dfce4871fe6abcb57fd207f7d39a0ae171835bada862')

prepare() {
  cd "$pkgname-$pkgver"

  GOPATH=`pwd` go get -d -v
}

build() {
  cd "$pkgname-$pkgver"

  GOPATH=`pwd` go build
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"

  cd ..
  install -Dm644 "$pkgname.sh" "$pkgdir/etc/profile.d/$pkgname.sh"
}

# vim:set ts=2 sw=2 et:
