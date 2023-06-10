# Maintainer: Hao Long <aur@esd.cc>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Aaron Blair <aaron@aaronpb.me>

pkgname=subfinder
pkgver=2.6.0
pkgrel=1
pkgdesc='A subdomain discovery tool that discovers valid subdomains for websites'
arch=('x86_64' 'armv6h' 'aarch64')
url='https://github.com/projectdiscovery/subfinder'
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('49bc9b3fbf0b4f08bfbec15d0b539ac021bcc1052bc55c0b7c9928e9ba6d75fc35d9340a1dc8a38cc614d4d241aa5cefefb9726e87e123ec3a6516ecc702de5a')

build() {
  cd "${pkgname}-${pkgver}/v2/cmd/${pkgname}/"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build .
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dvm755 "./v2/cmd/${pkgname}/${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE.md' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
