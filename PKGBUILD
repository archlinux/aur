# Maintainer: Hao Long <aur@esd.cc>

pkgname=shuffledns
pkgver=1.0.4
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
sha256sums=('ad32332cb36f8a0715750fa7f7c2fc86b71af4cf945ac642b0a69fd859ee3d45')

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
