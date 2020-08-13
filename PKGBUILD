# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Aaron Blair <aaron@aaronpb.me>

pkgname=subfinder
pkgver=2.4.1
pkgrel=1
pkgdesc='Subdomain discovery tool'
arch=('x86_64')
url='https://github.com/projectdiscovery/subfinder'
license=('MIT')
makedepends=('go')
provides=("${pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('bb5cee73d754cb92729eb4c446fd6cda87b4709e4e32996f5eedae7cb1967dfc')

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  export GOPATH="${srcdir}"

  cd "${pkgname}-${pkgver}"
  go build -v -o "${pkgname}" ."/cmd/${pkgname}"
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 -t "${pkgdir}/usr/bin" "${pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" 'README.md'
  install -Dm644 'LICENSE.md' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
