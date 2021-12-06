# Maintainer: Jeff Henson <jeff@henson.io>
# Old Maintainer: David Runge <dvzrv@archlinux.org>

_name=jfrog
pkgname=jfrog-cli
pkgver=2.8.3
pkgrel=1
pkgdesc="Simple interface to Artifactory, Bintray and Mission Control"
arch=('x86_64')
url="https://github.com/jfrog/jfrog-cli"
license=('Apache')
depends=('glibc')
conflicts=('jfrog-cli-go')
replaces=('jfrog-cli-go')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jfrog/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('f957120182ed0b1055034fb1f6ece016528da9bcb36bd56bc88c66351823fda2288054dd8aeb73f14ac857b5e4aa337c117a76028f6a6bde1de93f2d8de98589')

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
