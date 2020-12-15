# Maintainer: David Runge <dvzrv@archlinux.org>

_name=jfrog
_upstream_name=jfrog-cli
pkgname=jfrog-cli-go
pkgver=1.42.0
pkgrel=1
pkgdesc="Simple interface to Artifactory, Bintray and Mission Control"
arch=('x86_64')
url="https://github.com/jfrog/jfrog-cli"
license=('Apache')
depends=('glibc')
makedepends=('git' 'go')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/jfrog/${_upstream_name}/archive/v${pkgver}.tar.gz")
sha512sums=('dd0650746ea2e057cca7f6b7badd37af4541ab6ac614074c39aa0fa991d8a349d779948afe3a1b5cec9d675c09206b19ae0cd813395536f3956b7681a379a1a9')
b2sums=('ae36ecf0c8e076fe8ada1c36dd2ed963a9c8d82317fd95e7df67ba5fab6e9b0e46a369f1a2655f9c506e03462f16719156f5dfdc46f5858940c62dc3e9e8037a')

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

