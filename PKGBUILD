# Maintainer: Alexandre Pujol <alexandre@pujol.io>

pkgname=apparmor.d-git
pkgver=0.1203
pkgrel=1
pkgdesc="Full set of apparmor profiles"
arch=("x86_64")
url="https://github.com/roddhjav/apparmor.d"
license=('GPL2')
depends=('apparmor')
makedepends=('go' 'git' 'rsync')
conflicts=('apparmor.d')
source=("$pkgname::git+https://github.com/roddhjav/apparmor.d.git")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo "0.$(git rev-list --count HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  make
}

package() {
  cd "$srcdir/$pkgname"
  make install DESTDIR="$pkgdir"
}
