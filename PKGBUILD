pkgname=tcping-go-git
_pkgname=tcping
pkgver=1.12.1.r29.g3a1dc3a
pkgrel=1
pkgdesc="Ping TCP ports. Inspired by Linux's ping utility. Written in Go"
provides=('tcping' 'tcping-go')
conflicts=('tcping' 'tcping-go')
arch=('x86_64')
url="https://github.com/pouriyajamshidi/tcping"
license=('MIT')
makedepends=('go' 'git')
source=("git+https://github.com/pouriyajamshidi/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//g'
}

build() {
  cd "$srcdir/tcping"
  go build \
      -trimpath \
      -buildmode=pie \
      -mod=readonly \
      -modcacherw \
      -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
      .
}

package() {
  cd "$srcdir/tcping"
  install -Dm755 $_pkgname "$pkgdir"/usr/bin/$_pkgname
}
