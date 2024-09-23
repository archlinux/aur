# Maintainer: Matt Harrison <matt@harrison.us.com>
# Contributor: David Hummel <hummeltech@sherpaguru.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=firefox-extension-bitwarden
pkgver=2024.9.1
pkgrel=1
pkgdesc='Bitwarden browser extension for Firefox'
arch=('any')
url='https://github.com/bitwarden/clients'
license=('GPL-3.0-or-later')
optdepends=('firefox')
groups=('firefox-addons')
pkgdesc='Bitwarden browser extension for Firefox'
makedepends=('nodejs' 'npm' 'unzip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bitwarden/clients/archive/refs/tags/browser-v${pkgver}.tar.gz")
sha256sums=('583b1ad73c95e605bf1d95b879a441b3dbd9fb31e0848616c6d32d80e0d76274')

prepare() {
  cd "${srcdir}/clients-browser-v${pkgver}" || exit
  npm ci
}

build() {
  cd "${srcdir}/clients-browser-v${pkgver}/apps/browser" || exit
  npm run dist:firefox
}

check() {
  cd "${srcdir}/clients-browser-v${pkgver}/apps/browser" || exit
  npm run test
}

package() {
  install -Dm644 "${srcdir}/clients-browser-v${pkgver}/apps/browser/dist/dist-firefox.zip" "${pkgdir}/usr/lib/firefox/browser/extensions/{446900e4-71c2-419f-a6a7-df9c091e268b}.xpi"
}
