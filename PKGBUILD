#Maintainer: Zachary Jordan <zacjor1 at gmail dot com>
#PKGBUILD based off https-everywhere-chrome-git from Yardena Cohen <yardenack at gmail dot com>

pkgsubn=Reddit-Enhancement-Suite
pkgname=reddit-enhancement-suite-chromium-git
pkgver=v5.13.3.r24.g4fff1e72e
pkgrel=3
pkgdesc="Chrome/Chromium extension for Reddit Enhancement Suite - git/dev"
arch=('any')
url='https://github.com/honestbleeps/Reddit-Enhancement-Suite'
license=('GPL3')
makedepends=(git nodejs)
source=("git+https://github.com/honestbleeps/Reddit-Enhancement-Suite.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgsubn}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
build() {
	cd "${srcdir}/${pkgsubn}"
	npm install --cache "${srcdir}/npm-cache"
	npm run once
}
package() {
	 mkdir -p "${pkgdir}/usr/share/${pkgname}"
	 shopt -s dotglob
	 cp -dr --no-preserve=ownership "${srcdir}/${pkgsubn}/dist/chrome"/* "${pkgdir}/usr/share/${pkgname}"
}
