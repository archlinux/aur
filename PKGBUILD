# Maintainer: David Runge <dvzrv@archlinux.org>

_name=jfrog
_upstream_name=jfrog-cli
pkgname=jfrog-cli-go
pkgver=1.41.1
pkgrel=1
pkgdesc="Simple interface to Artifactory, Bintray and Mission Control"
arch=('x86_64')
url="https://github.com/jfrog/jfrog-cli"
license=('Apache')
depends=('glibc')
makedepends=('git' 'go')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/jfrog/${_upstream_name}/archive/v${pkgver}.tar.gz")
sha512sums=('f1b6896c7b85669f487226223dae1d9d0f65dd4952cd88c3b5c4b16b74dd018c6ab75e5f7c645873e4ae0542f50b671e23da4c5320c67a7b1271dc1ee5c0b5cb')
b2sums=('d8b6ae3b82306426b0147c06094d52e5b896da486c54f2b42975f60ede4e3943e7a021e060a19f98958e8dbc4c131a15d9103e16aa7e9a3373ffe89e6712ab98')

build() {
  cd "${_upstream_name}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o ${_name}
}

package() {
  cd "${_upstream_name}-${pkgver}"
  install -vDm 755 ${_name} -t "${pkgdir}/usr/bin/"
  install -vDm 644 {README,RELEASE}.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

