# Maintainer: Hao Long <aur@esd.cc>

pkgname=shuffledns
pkgver=1.0.7
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
b2sums=('8da4b79e36c3401d959fd630bdd73f5e3d6dceaa568520c0fa63f5f91a0dea5d75d5d42359ebdfca06819cd82d351695b05f816da1a97b242c47f4a3f99ba7e2')

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
