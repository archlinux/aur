# Maintainer: Antoine Lubineau <antoine@lubignon.info>
pkgname=stunner
pkgver=0.0.11
_commit=1db6460188f1020c843d4084c486044a4258ed1b
pkgrel=1
pkgdesc="Detect your NAT quickly and easily"
arch=('x86_64')
url="https://github.com/jaxxstorm/stunner"
license=('MIT')
depends=()
makedepends=('git' 'go')
options=()
source=("git::git+https://github.com/jaxxstorm/stunner#commit=${_commit}")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/git"
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-X main.Version=${pkgver} -linkmode external -extldflags \"${LDFLAGS}\"" \
    -o . ./...
}

package() {
  install -D -m 0755 -t "${pkgdir}/usr/bin" "$srcdir/git/${pkgname}"
  install -D -m 0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" "$srcdir/git/LICENSE"
}
