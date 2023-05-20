# Maintainer: Hao Long <aur@esd.cc>

pkgname=shuffledns
pkgver=1.0.9
pkgrel=1
pkgdesc="A wrapper around massdns written in go"
arch=("x86_64" "i686")
url="https://github.com/projectdiscovery/shuffledns"
license=("GPL3")
provides=('shuffledns')
conflicts=('shuffledns')
depends=("massdns")
makedepends=("go")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('84d2894c4f8cca7c2a27961f69c9b068c8b856c519776967f18a78ed22270669ef8be6c3d1409d7d717ea5ec135be0630a390755349e7ce9507aa0de6f18659a')

build() {
  cd ${pkgname}-${pkgver}/cmd/${pkgname}
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-extldflags \"${LDFLAGS}\"" \
    .
}

package() {
  cd ${pkgname}-${pkgver}/cmd/${pkgname}
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
