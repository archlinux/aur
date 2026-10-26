# Maintainer: Twilight0 <twilight0@vivaldi.net>

pkgname=tizen-cli
_pkgname=tizen-cli
_commit=8e0289b6c35d5bb9430b27ccbd4601724bfa2a05
pkgver=1.1.0
pkgrel=3
pkgdesc="Lightweight CLI to build, install, and launch Tizen applications without Tizen Studio"
arch=('any')
url="https://github.com/Twilight0/tizen-cli"
license=('GPL-3.0-only')
depends=('nodejs')
makedepends=('npm')
provides=('tizenjs' 'tizen.js')
conflicts=('tizenjs' 'tizen.js')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/Twilight0/tizen-cli/archive/${_commit}.tar.gz")
sha256sums=('da3f76e61c03fdf99bdbc84155e6d35fc23eb4c1a16a5923001c01e05da1332a')

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
