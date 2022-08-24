# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Katie Wolfe <katie@dnaf.moe>
pkgname=blush
pkgver=0.6.0
pkgrel=1
pkgdesc='Grep with colours in go'
arch=('x86_64' 'aarch64')
url='https://github.com/arsham/blush'
license=('MIT')
makedepends=('go')
provides=('blush')
source=("${pkgname}-${pkgver}::https://github.com/arsham/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6db6b033bb5d4c4ac350b36b82d79447d5b91509db3a5eceb72ecb9484495e54')

build() {
  cd ${pkgname}-${pkgver}
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build/${pkgname} 
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm755 build/"${pkgname}" "${pkgdir}"/usr/bin/"${pkgname}"
  install -Dm644 README.md "$pkgdir"/usr/share/doc/"$pkgname"/README.md
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

