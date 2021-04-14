# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=gnome-shell-extension-espresso-git
pkgver=v37.r18.g7d59a4b
pkgrel=1
pkgdesc="Prevent auto suspend and screensaver functions (forked from caffeine)"
arch=('any')
url="https://github.com/coadmunkee/gnome-shell-extension-espresso.git"
install=espresso.install
license=('GPL2')
depends=('gnome-shell')
makedepends=('git')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${pkgname}"

	./update-locale.sh
	glib-compile-schemas \
		--strict \
		--targetdir=espresso@coadmunkee.github.com/schemas/ \
			espresso@coadmunkee.github.com/schemas
}

package() {
	cd "${srcdir}/${pkgname}"

	install -dm755 "${pkgdir}/usr/share/gnome-shell/extensions"
	cp -a "espresso@coadmunkee.github.com" "${pkgdir}/usr/share/gnome-shell/extensions"
}
