# Maintainer: Jeff Henson <jeff@henson.io>
# Maintainer: David Runge <dvzrv@archlinux.org>

_name=jfrog
pkgname=jfrog-cli
pkgver=1.46.4
pkgrel=1
pkgdesc="Simple interface to Artifactory, Bintray and Mission Control"
arch=('x86_64')
url="https://github.com/jfrog/jfrog-cli"
license=('Apache')
depends=('glibc')
replaces=('jfrog-cli-go')
makedepends=('git' 'go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jfrog/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('71fb5e0a4487bde69ee25ad78ac0c6f780182f3b3ea330c3e74bbe51b6f3fdb3b4852480ffbb04b417aa6be89dbbed9b9843894b65f6edcb7decd19eb7e85daf')
b2sums=('112ea995c99f44f14589556e4faf92e9d36f43327c1f192e5fcd17965377068bd17e57269b921560f2ad094b1c04ca1f8c63a2c9390bfed0b7709cb6c2e29c4b')

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o ${_name}
}

package() {
  cd "${pkgname}-${pkgver}"
  install -vDm 755 ${_name} -t "${pkgdir}/usr/bin/"
  install -vDm 644 {README,RELEASE}.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

