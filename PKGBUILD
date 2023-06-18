pkgname=firefox-extension-bitwarden-git
pkgver=vNext.r1200.gd3d17f1
pkgrel=1
pkgdesc='Bitwarden addon for Firefox'
arch=('any')
url='https://addons.mozilla.org/en-US/firefox/addon/bitwarden-password-manager/'
license=('GPLV3')
makedepends=('nodejs' 'npm')
depends=('firefox')
groups=('firefox-addons')
provides=('firefox-extension-bitwarden')
conflicts=('firefox-extension-bitwarden')
source=('clients::git+https://github.com/bitwarden/clients.git')
sha256sums=('SKIP')

pkgver() {
  cd clients
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd clients
  npm ci
}

build() {
  cd clients/apps/browser
  npm run dist:firefox
}

check() {
  cd clients/apps/browser
  npm run test
}

package() {
  install -Dm644 clients/apps/browser/dist/dist-firefox.zip "${pkgdir}/usr/lib/firefox/browser/extensions/{446900e4-71c2-419f-a6a7-df9c091e268b}.xpi"
}

