# Maintainer: ml <ml@visu.li>
pkgname=ksd
pkgver=1.0.5
pkgrel=1
pkgdesc='kubernetes secret decoder'
arch=('x86_64' 'i686')
url='https://github.com/mfuentesg/ksd'
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('f6ad0468ce2ab6b79e709aa584fa7905ea0beba985484ed154c49036a869f81e')

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS='-buildmode=pie -modcacherw -trimpath'
  go build -o "$pkgname" -ldflags "-X main.version=v${pkgver}"
}

check() {
  cd "${pkgname}-${pkgver}"
  go test
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 -t "${pkgdir}/usr/bin" "$pkgname"
  install -Dm755 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
