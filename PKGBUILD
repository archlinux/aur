# Maintainer: Jeff Henson <jeff@henson.io>
# Old Maintainer: David Runge <dvzrv@archlinux.org>

_name=jfrog
pkgname=jfrog-cli
pkgver=2.5.0
pkgrel=1
pkgdesc="Simple interface to Artifactory, Bintray and Mission Control"
arch=('x86_64')
url="https://github.com/jfrog/jfrog-cli"
license=('Apache')
depends=('glibc')
conflicts=('jfrog-cli-go')
replaces=('jfrog-cli-go')
makedepends=('git' 'go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jfrog/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('cdb017d91a468292bca593651117c55934522e113808bac869e324b18b75af36ca3f6ec40081546df8995b049009dec5c17887f9ab2dc76ac43084a1f04f95af')

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

