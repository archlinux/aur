# Maintainer: Sebastian Kunze <mail at sebastiankunze dot de>

pkgname=tgswitch
pkgver=0.6.0
pkgrel=1
pkgdesc='The tgswitch command line tool lets you switch between different versions of terragrunt.'
arch=('x86_64')
url='https://github.com/warrensbox/tgswitch'
license=('MIT')
makedepends=('go')
conflicts=('tgswitch-bin')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('7a92abe68459b61857fc5f945ceef155d72c64954aa9deb409be47550ccd36e2')

build() {
  cd "tgswitch-${pkgver}"
  go build \
    -trimpath \
    -ldflags "-s -w -X main.version=${pkgver}" \
    -o "${pkgname}" .
}

package() {
  cd "tgswitch-${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
