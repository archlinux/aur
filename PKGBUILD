# Maintainer: Matt Harrison <matt@harrison.us.com>
# Contributor: David Hummel <hummeltech@sherpaguru.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=firefox-extension-bitwarden
pkgver=2025.8.0
pkgrel=1
pkgdesc='Bitwarden browser extension for Firefox'
arch=('any')
url='https://github.com/bitwarden/clients'
license=('GPL-3.0-or-later')
optdepends=('firefox')
groups=('firefox-addons')
pkgdesc='Bitwarden browser extension for Firefox'
makedepends=('nodejs' 'npm' 'unzip' 'zip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bitwarden/clients/archive/refs/tags/browser-v${pkgver}.tar.gz")
b2sums=('8be66c91424cff55fc16d213a13cca44e854a54b3057a350fe85a6d1e06337f94616c91dda1d5a82f7ad0468f8fd3f4f520ba903489b2177e105ddd475dd50d5')

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
