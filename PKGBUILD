# Maintainer: Hao Long <aur@esd.cc>

pkgname=naabu
pkgver=2.0.7
pkgrel=1
pkgdesc="A fast port scanner written in go with focus on reliability and simplicity"
arch=("x86_64" "i686")
url="https://github.com/projectdiscovery/naabu"
license=("MIT")
depends=("libpcap")
makedepends=("go")
source=("$pkgname-$pkgver.tar.gz::https://github.com/projectdiscovery/naabu/archive/v${pkgver}.tar.gz")
b2sums=('795a3c1431d4d29c4979aa4dbed69729f80b10c0eba62b1a64684ce2e9a3438fe6c0aa081e193398504705c74cdaa645f4a2e4cb809eaf1ea6a0071832eb7448')

build() {
  cd ${pkgname}-${pkgver}/v2/cmd/${pkgname}
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build .
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm644 LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
  install -Dm755 v2/cmd/naabu/naabu ${pkgdir}/usr/bin/naabu
}
