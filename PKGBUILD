# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=sketchviz
pkgname=${_base}-git
pkgver=r5.d977905
pkgrel=1
pkgdesc="Command-line clone of sketchviz.com"
arch=(any)
url="https://github.com/gpotter2/${_base}"
license=(MIT)
depends=(nodejs graphviz)
makedepends=(npm git)
options=(!emptydirs)
provides=("${_base}")
conflicts=("${_base}")
source=(git+${url}.git#branch=master)
sha512sums=('SKIP')

pkgver() {
  cd ${_base}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  tar --exclude="${_base}/.git" -zcf ${_base}.tar.gz ${_base}
}

package() {
  npm install -g --prefix "$pkgdir"/usr "$srcdir"/${_base}.tar.gz
  chown -R root:root "$pkgdir"
  install -Dm644 "${pkgdir}/usr/lib/node_modules/${_base}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 "${pkgdir}/usr/lib/node_modules/${_base}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}