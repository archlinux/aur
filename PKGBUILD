# Maintainer: s3rj1k <evasive dot gyron at gmail dot com>
# Hint: don't forget to run `makepkg --printsrcinfo > .SRCINFO`

pkgname=openconnect-tweak-git
_pkgname=${pkgname%-git}
pkgver=r2.5c3c77b
pkgrel=1
pkgdesc="LD_PRELOAD library for tweaking OpenConnect VPN client."
arch=('any')
url="https://github.com/s3rj1k/openconnect-tweak"
license=('MIT')
depends=('openconnect')
makedepends=('git' 'gcc')
source=("git+https://github.com/s3rj1k/openconnect-tweak.git#branch=main")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"

  make clean compile
}

package() {
  cd "$srcdir/$_pkgname"

  install -D -m644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m755 "openconnect-tweak.so" "$pkgdir/usr/lib/openconnect-tweak.so"
}
