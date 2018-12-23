# Maintainer: ZenQy <zenqy.qin@gmail.com>

pkgname=athens
pkgver=0.2.0
pkgrel=2
pkgdesc="A proxy server for the Go Modules download API"
arch=('x86_64')
url="https://github.com/gomods/athens"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz" 'athens.service')
md5sums=('ae76cf5bfedbd265077ccbf215a834b0'
         '5bb8e6295d07efcd72392f89702d9501')

build() {
  rm "${srcdir}/${pkgname}-${pkgver}/go.sum"
  cd "${srcdir}/${pkgname}-${pkgver}/cmd/proxy"
  go build -ldflags "-extldflags ${LDFLAGS}" -buildmode=pie
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/cmd/proxy/proxy" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/config.dev.toml" "${pkgdir}/etc/${pkgname}/config.toml"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/athens/LICENSE"
  install -Dm644 "${srcdir}/athens.service" "$pkgdir/usr/lib/systemd/system/athens.service"
}