# Maintainer: bobpaul

_pkgbase=yj
pkgname=${_pkgbase}-git
pkgver=r33.ce9ec1f
pkgrel=1
pkgdesc="Convert YAML <=> TOML <=> JSON <=> HCL"
url="https://github.com/sclevine/yj"
depends=()
makedepends=('go')
provides=('yj')
conflicts=('yj')
license=('APACHE')
arch=('x86_64')
source=("yj::git+https://github.com/sclevine/yj.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/yj"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/yj"
  go mod download
  go build -race
}

package() {
  cd "$srcdir/yj"
  install -D -m755 ${_pkgbase} "${pkgdir}/usr/bin/${_pkgbase}"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
