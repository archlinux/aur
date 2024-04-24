# Maintainer: bobpaul

_pkgbase=synapse-admin
pkgname=${_pkgbase}-git
pkgver=r360.b112689
pkgrel=1
pkgdesc="A Matrix administration panel using react-admin"
arch=(any)
conflicts=(synapse-admin)
license=(Apache2.0)
depends=(nodejs yarn)
makedepends=(git)
optdepends=()
url=https://github.com/Awesome-Technologies/${_pkgbase}
source=("${_pkgbase}::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgbase}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${_pkgbase}"
  yarn install
}

build() {
  cd "$srcdir/${_pkgbase}"
  yarn build --base=./
}

package() {
  cd "$srcdir/${_pkgbase}"

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgbase}/LICENSE"
  mkdir -p "${pkgdir}/usr/share/webapps/${_pkgbase}"
  cp -r dist/* "${pkgdir}/usr/share/webapps/${_pkgbase}/"

}
