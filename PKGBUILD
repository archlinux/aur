# Maintainer: Twilight0 <twilight0@vivaldi.net>

pkgname=tizen-cli
_pkgname=tizen-cli
_commit=5717a6f882c561f739c194a8dd075f985f756d39
pkgver=1.1.0
pkgrel=2
pkgdesc="Lightweight CLI to build, install, and launch Tizen applications without Tizen Studio"
arch=('any')
url="https://github.com/Twilight0/tizen-cli"
license=('GPL-3.0-only')
depends=('nodejs')
makedepends=('npm')
provides=('tizenjs' 'tizen.js')
conflicts=('tizenjs' 'tizen.js')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/Twilight0/tizen-cli/archive/${_commit}.tar.gz")
sha256sums=('d7dc3dd2838fbda762ce0be7cfcb699260295ee5a13fe5f84b5fcc42c266c7fa')

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
