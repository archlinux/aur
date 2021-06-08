# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>
# Contributor: Samuel Walladge <aur at swalladge dot net>

pkgname=peco
pkgver=0.5.10
pkgrel=1
pkgdesc='Simplistic interactive filtering tool'
arch=('i686' 'x86_64')
url='https://github.com/peco/peco'
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('781c2effc4f6a58d9ff96fb0fc8b0fba3aab56a91a34933d68c5de3aea5fe3f6')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -modcacherw"
  export GOPATH="${srcdir}" GOROOT_FINAL="/usr/bin" GO111MODULE=on
  mkdir -p out
  go mod download
  go build -o "out/${pkgname}" "cmd/${pkgname}/${pkgname}.go"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  install -Dm755 "out/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/peco/LICENSE"
}

# vim:set ts=2 sw=2 et:
