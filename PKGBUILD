# Contributor: ZenQy <zenqy.qin@gmail.com>

pkgname=athens
pkgver=0.17.1
pkgrel=1
pkgdesc="A proxy server for the Go Modules download API"
arch=('x86_64')
url="https://github.com/gomods/athens"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz" 'athens.service')
b2sums=('debe697be63f0a2ac9abe6d8cd3d8974f7f22329f15ec16b6b434cc39b4c10c096d23fc830538e270e76be439d884827b04448df83121aefbf2867f35d6188e6'
        '06e0bd59d00f8b2ff462a297a502b8fd78e4742c62c847b146d92eea4e777430256d6b458f33af862a00eeb55a489567adf87e53cd72998e23eb7e7c45abaf59')

build() {
  unset LDFLAGS
  cd "${srcdir}/${pkgname}-${pkgver}/cmd/proxy"
  go build -ldflags "-extldflags ${LDFLAGS}" -buildmode=pie
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/cmd/proxy/proxy" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/config.dev.toml" "${pkgdir}/etc/${pkgname}/config.toml"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/athens/LICENSE"
  install -Dm644 "${srcdir}/athens.service" "$pkgdir/usr/lib/systemd/system/athens.service"
}
