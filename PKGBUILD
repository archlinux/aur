# Maintainer: Twilight0 <twilight0@vivaldi.net>

pkgname=tizen-cli
_pkgname=tizen-cli
_commit=5044c0519d5e4a39b40f4a4735c35b202b9b2a7a
pkgver=1.1.0
pkgrel=4
pkgdesc="Lightweight CLI to build, install, and launch Tizen applications without Tizen Studio"
arch=('any')
url="https://github.com/Twilight0/tizen-cli"
license=('GPL-3.0-only')
depends=('nodejs')
makedepends=('npm')
provides=('tizenjs' 'tizen.js')
conflicts=('tizenjs' 'tizen.js')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/Twilight0/tizen-cli/archive/${_commit}.tar.gz")
sha256sums=('0aabe6d6cc4c69476e9c6627d0419977f22821abd87863d2a69193bc7b4008cf')

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
