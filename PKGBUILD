# Maintainer: Twilight0 <twilight0@vivaldi.net>

pkgname=tizen-cli
_pkgname=tizen.js
_commit=bc86be41ddcc19fcd1b01988291f4f2683da7a81
pkgver=1.0.1
pkgrel=2
pkgdesc="Lightweight CLI to rebuild, resign, and package Tizen applications without Tizen Studio"
arch=('any')
url="https://github.com/reisxd/tizen.js"
license=('GPL-3.0-only')
depends=('nodejs')
makedepends=('npm')
provides=('tizenjs' 'tizen.js')
conflicts=('tizenjs' 'tizen.js')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/Twilight0/tizen.js/archive/${_commit}.tar.gz")
sha256sums=('709af4a8fe29a3c9e7578cdc38d943d115c9974595a7020e65868964c370c0fd')

build() {
  cd "${_pkgname}-${_commit}"
  npm pack
}

package() {
  cd "${_pkgname}-${_commit}"
  npm install -g --prefix "${pkgdir}/usr" tizen-${pkgver}.tgz

  # Symlink aliases
  ln -sf tizenjs "${pkgdir}/usr/bin/tizen-cli"
  ln -sf tizenjs "${pkgdir}/usr/bin/tizen.js"

  # Clean npm metadata
  find "${pkgdir}" -name "package.json" -exec sed -i '/_where/d' {} + 2>/dev/null || true
  chmod u=rwX,go=rX -R "${pkgdir}"
}
