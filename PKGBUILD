# Maintainer: Max Harmathy <harmathy@alumni.tum.de>
# Contributor: Jeff Henson <jeff@henson.io>

pkgname=mobsh
pkgver=5.4.1
pkgrel=1
pkgdesc="Fast git handover for remote mob programming"
arch=('x86_64' 'i686')
url="https://github.com/remotemobprogramming/mob"
license=('MIT')
depends=('git')
optdepends=('espeak-ng-espeak: Multi-lingual software speech synthesizer'
            'mbrola-voices-us1: An American English female voice for the MBROLA synthesizer')
makedepends=('go')
conflicts=('mob')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('6f5b534887cac436f696e38e488b481b38c6cb1c3ad3860e56faf8e87f858344')

build() {
  cd "mob-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o mob
}

package() {
  cd "mob-${pkgver}"
  install -vDm 755 mob -t "${pkgdir}/usr/bin/"
  install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

