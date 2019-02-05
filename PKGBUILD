#Maintainer: Zachary Jordan <zacjor1 at gmail dot com>
#PKGBUILD based off https-everywhere-chrome-git from Yardena Cohen <yardenack at gmail dot com>

pkgsubn=BrowserExtension
pkgname=chromium-extension-steam-database-extension-git
pkgver=r345.f743de7
pkgrel=3
pkgdesc="Chrome/Chromium extension for Steam Databse Extension - git/dev"
arch=('any')
url='https://github.com/SteamDatabase/BrowserExtension'
license=('BSD-3-Clause')
makedepends=(git)
source=("git+https://github.com/SteamDatabase/BrowserExtension.git")
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
}
package() {
	 mkdir -p "${pkgdir}/usr/share/${pkgname}"
	 shopt -s dotglob
	 cp -dr --no-preserve=ownership "${srcdir}/${pkgsubn}/"/* "${pkgdir}/usr/share/${pkgname}"
}
