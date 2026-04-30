# Maintainer: NTeditor <nteditor4@gmail.com>
# Contributor: Dct Mei <dctxmei@yandex.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: jakka <jakkadoujin at gmail dot com>
# Contributor: MrSedan <elpashevs at bk dot ru>

pkgname=xray-domain-list-community
pkgver=20260429071553
pkgrel=1
pkgdesc="A list of domains to be used as geosites for routing purpose in Project V"
arch=('any')
url='https://github.com/v2fly/domain-list-community'
license=('MIT')
makedepends=('go')
source=("${pkgname#xray-}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('95d22b9b945c44f492ec95d8ee4e4317bb986d2ea0fb6ecd9766fe322bc6056c')

prepare() {
  cd "${srcdir}/${pkgname#xray-}-${pkgver}"
  go mod vendor
}

build() {
  cd "${srcdir}/${pkgname#xray-}-${pkgver}"
  go build -mod=vendor
  ./domain-list-community
}

package() {
  cd "${srcdir}/${pkgname#xray-}-${pkgver}"
  install -Dm644 dlc.dat "${pkgdir}/usr/share/xray/geosite.dat"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
