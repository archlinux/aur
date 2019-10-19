# Maintainer: Kevin Kuehler <keur@xcf.berkeley.edu>

_pkgname='gdlv'
pkgname="$_pkgname-git"
pkgver='r356.9555abd'
pkgrel=1
pkgdesc='Gdlv is a graphical frontend to Delve'
arch=('x86_64')
url="https://github.com/aarzilli/$_pkgname"
license=('GPL')
depends=('delve')
makedepends=('go')
provides=('gdlv')
conflicts=('gdlv')
source=("$_pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  go build \
    -trimpath \
    -ldflags "-extldflags $LDFLAGS" \
    -o "$_pkgname" .
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
