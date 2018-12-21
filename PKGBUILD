#Maintainer: Zachary Jordan <zacjor1 at gmail dot com>
#PKGBUILD based off https-everywhere-chrome-git from Yardena Cohen <yardenack at gmail dot com>

pkgsubn=Tab-Session-Manager
pkgname=tab-session-manager-chromium-git
pkgver=390.80f930e
pkgrel=1
pkgdesc="Chrome/Chromium extension for Tab Session Manager - git/dev"
arch=('any')
url='https://github.com/honestbleeps/Reddit-Enhancement-Suite'
license=('MIT')
makedepends=(git nodejs unzip)
source=("git+https://github.com/sienori/Tab-Session-Manager.git")
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgsubn}"
	local ver="$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
	printf "%s" "${ver//-/.}"
}
build() {
	cd "${srcdir}/${pkgsubn}"
	npm install --cache "${srcdir}/npm-cache" 
	npm run build
	cd dist/
	mkdir chrome
	unzip "*chrome*.zip" -d chrome
}
package() {
	 mkdir -p "${pkgdir}/usr/share/${pkgname}"
	 shopt -s dotglob
	 cp -dr --no-preserve=ownership "${srcdir}/${pkgsubn}/dist/chrome"/* "${pkgdir}/usr/share/${pkgname}"
}