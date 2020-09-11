# Maintainer: Solomon Choina <shlomochoina@gmail.com>

pkgname=plane-theme-git
pkgver=r179.a11a397
pkgrel=1
pkgdesc="A modern icon theme for gnome linux versions."
arch=('any')
url="https://github.com/wfpaisa/plane-icon-theme"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git' 'gulp' 'npm')
source=("${pkgname}::git+https://github.com/vantu5z/plane-theme")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${pkgname}"

	npm install
	gulp
}

package() {
	cd "${srcdir}/${pkgname}"

	cd "build"
	for i in $(ls -d *); do
		find "$i" -type f -exec install -D -m 644 '{}' "${pkgdir}"/usr/share/themes/'{}' \; ;
	done
}
