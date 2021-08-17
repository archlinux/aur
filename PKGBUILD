# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=k8s-ldap-auth
pkgdesc="Kubernetes webhook token authentication plugin implementation using ldap."
pkgver=3.0.0
pkgrel=1
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="https://github.com/vbouchaud/k8s-ldap-auth"
license=('MPL2')
makedepends=(
    'go'
)

source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/vbouchaud/k8s-ldap-auth/archive/v${pkgver}.tar.gz"
)

sha256sums=(
    "bd46ebae08fc850065db7ab2ed38c47dbf85156585c31323d3157101f42e35da"
)

build() {
  export GOPATH="$srcdir"/gopath
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_ENABLED=1

  cd "$srcdir/$pkgname-$pkgver"
  make VERSION=v$pkgver k8s-ldap-auth
}

package() {
  install -D -m0755 "${srcdir}/$pkgname-$pkgver/k8s-ldap-auth" "${pkgdir}/usr/bin/k8s-ldap-auth"
}
