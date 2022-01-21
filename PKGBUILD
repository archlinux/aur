# Maintainer: Hao Long <aur@esd.cc>

pkgname=shuffledns
pkgver=1.0.6
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
b2sums=('d97dd0737a581f57ffd43511e14b1d53ccd195f573628f2f1c41a15fa84e338887080b4dc000c9dab9db8094f3aa0d2772dbda17db9b70e0738aca2a083cbcb0')

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
