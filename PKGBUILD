# Maintainer: Tyler Brock <tyler.brock@gmail.com>
pkgname=saw
pkgver=0.1.1
pkgrel=1
pkgdesc="Fast, multipurpose tool for AWS CloudWatch Logs"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
provides=('saw')
url="https://github.com/TylerBrock/$pkgname"
license=('MIT')
makedepends=('go' 'git' 'dep')
source=("https://github.com/TylerBrock/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('7f05c0b36cf34175b237846c4f061188')

prepare() {
  mkdir -p "${srcdir}/src/github.com/TylerBrock/"
  mv "${srcdir}/${pkgname}-${pkgver}" "${srcdir}/src/github.com/TylerBrock/${pkgname}"
}

build() {
  cd "${srcdir}/src/github.com/TylerBrock/${pkgname}"
  GOPATH="${srcdir}"
  dep ensure
  go build .
}

package() {
  cd "${srcdir}/src/github.com/TylerBrock/${pkgname}"
  install -Dm755 saw "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
