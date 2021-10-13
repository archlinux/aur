# Maintainer: Hao Long <aur@esd.cc>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Aaron Blair <aaron@aaronpb.me>

pkgname=subfinder
pkgver=2.4.9
pkgrel=1
pkgdesc='A subdomain discovery tool that discovers valid subdomains for websites'
arch=('x86_64' 'armv6h' 'aarch64')
url='https://github.com/projectdiscovery/subfinder'
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('117000d5625713894f1e6c4052d3bc09aa4d77bf432bcc6cb5b77a29097189f95d8d9a30879cafb366bce560571acdee5707d88f5282061f4c4f72564af18faa')

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
