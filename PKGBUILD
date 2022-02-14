#PKGBUILD based off https-everywhere-chrome-git from Yardena Cohen <yardenack at gmail dot com>

pkgsubn=csgo-trader-extension
pkgname=chromium-extension-csgo-trader-git
pkgver=r2171.902c85da
pkgrel=1
pkgdesc="Chrome/Chromium extension for CSGO Trader - git/dev"
arch=('any')
url='https://github.com/gergelyszabo94/csgo-trader-extension'
license=('GPL-3.0')
makedepends=(git)
source=("git+https://github.com/gergelyszabo94/csgo-trader-extension.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgsubn}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
build() {
	cd "${srcdir}/${pkgsubn}/extension"
  npm install --cache "${srcdir}/npm-cache" 
  npm run build
}
package() {
	 mkdir -p "${pkgdir}/usr/share/${pkgname}"
	 shopt -s dotglob
	 cp -dr --no-preserve=ownership "${srcdir}/${pkgsubn}/extension/build/"/* "${pkgdir}/usr/share/${pkgname}"
}
