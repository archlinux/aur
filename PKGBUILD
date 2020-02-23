# Maintainer: Chad Kunde <Kunde21@gmail.com>

pkgname=gopls
pkgver=v0.3.2
pkgrel=1
pkgdesc='Language server for Go programming language'
arch=(x86_64 aarch64 armv7h armv7l)
url='https://github.com/golang/tools/blob/master/gopls'
license=(BSD)
depends=(glibc)
makedepends=('git'
             'go>=1.12')
conflicts=('go-tools'
           'go-tools-complete-git')
provides=('gopls')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/golang/tools/archive/gopls/${pkgver}.tar.gz")
sha256sums=('e762dfb20f356627cb0beac2b85846bd1c10d916eaf0b3b3a9f49ad09adf9cca')

build() {
  cd "tools-${pkgname}-${pkgver}/${pkgname}"

  GO111MODULE=on go build -o "../../$pkgname" -trimpath
  mv ../LICENSE ../../LICENSE
}

package() {
  install -Dm755 "${pkgname}" -t "${pkgdir}"/usr/bin/
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}

# vim: ts=2 sw=2 et:
