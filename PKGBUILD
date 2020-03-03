# Maintainer: Chad Kunde <Kunde21@gmail.com>

pkgname=gopls
pkgver=v0.3.3
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
sha256sums=('0493ff54a38d24e21f7460eca6db33c6fe590a6280863a6475d72bb6b0c863be')

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
