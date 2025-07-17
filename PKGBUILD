# Maintainer: Antoine Lubineau <antoine@lubignon.info>
pkgname=stunner
pkgver=0.0.12
_commit=143d3671ec2f0d9575164d9f65e2b8785da15c14
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
