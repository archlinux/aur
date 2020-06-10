# Maintainer: Hao Long <aur@esd.cc>

pkgname=naabu
pkgver=1.1.3
pkgrel=1
pkgdesc="A fast port scanner written in go with focus on reliability and simplicity"
arch=("x86_64" "i686")
url="https://github.com/projectdiscovery/naabu"
license=("GPL3")
depends=("libpcap")
makedepends=("go")
source=("$pkgname-$pkgver.tar.gz::https://github.com/projectdiscovery/naabu/archive/${pkgver}.tar.gz")
sha256sums=('35b89aa5d69b945a04044bcb124bd1606504a44418bf9f0b33512cfd1bbc48da')

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
  cd ${pkgname}-${pkgver}
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -Dm755 cmd/naabu/naabu ${pkgdir}/usr/bin/naabu
}
