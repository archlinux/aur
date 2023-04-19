# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=plane-icon-theme-git
pkgver=r201.ba8bd6a
pkgrel=1
pkgdesc="A modern icon theme for gnome linux versions."
arch=('any')
url="https://github.com/wfpaisa/plane-icon-theme"
license=('GPL3')
depends=('gnome-shell')
options=(!strip)
makedepends=('git' 'gulp' 'npm')
source=("${pkgname}::git+https://github.com/wfpaisa/plane-icon-theme.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${pkgname}"

	npm install gulp
	gulp
}

package() {
	cd "${srcdir}/${pkgname}"

	cd "build/variants"
	for i in $(ls -d *); do
		find "$i" -type f -exec install -D -m 644 '{}' "${pkgdir}"/usr/share/icons/'{}' \; ;
	done
}
