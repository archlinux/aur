# Maintainer: David Runge <dvzrv@archlinux.org>

_name=jfrog
_upstream_name=jfrog-cli
pkgname=jfrog-cli-go
pkgver=1.46.1
pkgrel=1
pkgdesc="Simple interface to Artifactory, Bintray and Mission Control"
arch=('x86_64')
url="https://github.com/jfrog/jfrog-cli"
license=('Apache')
depends=('glibc')
makedepends=('git' 'go')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/jfrog/${_upstream_name}/archive/v${pkgver}.tar.gz")
sha512sums=('c79c10a578bcc4047fa5625d00dbec9b3fa9f4ce3a25f32b3c1015a7c354e4192d80870c5ef41f0ca324aacba2c8e11d8f843bd5e437701828aecb0f2e1895c9')
b2sums=('ee92997cfc46da3af15633774bd52c590d858a4c696c98684970d7303c321ddd86074d144f23adbe3d7e20323ec3afb1bffeea72e9a49428ada373737d30d754')

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

