# Maintainer: danieltetraquark
pkgname=service-tools-git
_pkgname=service-tools
pkgver=r54.48577a1
pkgrel=2
pkgdesc='A growing collection of convenient little tools to work with systemd services'
provides=('service-tools')
arch=('any')
url="https://github.com/muesli/service-tools"
license=('MIT')
makedepends=('git' 'go')
depends=('systemd')
source=("git+https://github.com/muesli/service-tools")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}/service-generator"
  go build
  cd ../service-monitor
  go build

#  go build \
#    -gcflags "all=-trimpath=$PWD" \
#    -asmflags "all=-trimpath=$PWD" \
##    -ldflags "-extldflags $LDFLAGS" \
#    -o $pkgname .
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm755 service-generator/service-generator "$pkgdir"/usr/bin/service-generator
  install -Dm755 service-monitor/service-monitor "$pkgdir"/usr/bin/service-monitor
}

