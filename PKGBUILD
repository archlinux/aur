# Maintainer: Hao Long <aur@esd.cc>

pkgname=shuffledns
pkgver=1.2.1
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
b2sums=('5b2745ff8cd36aef3f9eb1850480eec0b62e18d501724774e4d9b085919f65309a040330412f04bd10995028fcb2c40b170e74887cf45288480c35184cddcd5b')

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
