# Maintainer: Jeff Henson <jeff@henson.io>
# Old Maintainer: David Runge <dvzrv@archlinux.org>

_name=jfrog
pkgname=jfrog-cli
pkgver=2.14.1
pkgrel=1
pkgdesc="Simple interface to Artifactory, Bintray and Mission Control"
arch=('x86_64')
url="https://github.com/jfrog/jfrog-cli"
license=('Apache')
depends=('glibc')
conflicts=('jfrog-cli-go')
replaces=('jfrog-cli-go')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jfrog/${pkgname}/archive/v.${pkgver}.tar.gz")
sha512sums=('f39eccf2b357fa14720f9851af720d8ea4351c4b3f31d34327cd918e1351761d2acf6e8a043b1c5b8bb696126e9c8451eb296055573129443d72d38154346419')

build() {
  cd "${pkgname}-v.${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o ${_name}
}

package() {
  cd "${pkgname}-v.${pkgver}"
  install -vDm 755 ${_name} -t "${pkgdir}/usr/bin/"
  install -vDm 644 {README,RELEASE}.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
