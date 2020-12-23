# Maintainer: ml <>
pkgname=kpt
pkgver=0.37.1
pkgrel=1
pkgdesc='Toolkit to manage, manipulate, customize, and apply Kubernetes Resource configurations'
arch=('x86_64')
url='https://googlecontainertools.github.io/kpt/'
license=('Apache')
depends=('git')
makedepends=('go')
optdepends=('asciinema: ttl command')
install=kpt.install
source=("https://github.com/GoogleContainerTools/kpt/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('ecf036d385c473cbfd90602c2356bae8310c39e32f9bf539127054d8f68dbbe4')

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_ENABLED=1
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS='-buildmode=pie -modcacherw -mod=readonly -trimpath'
  go build -o "$pkgname" -ldflags=-linkmode=external
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "$pkgname" -t "${pkgdir}/usr/bin"
}
