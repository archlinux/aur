# Maintainer: JSH <jsh6789@gmail.com>
pkgname=tt-rss-plugin-api-resize-git
pkgver=r28.070d17c
pkgrel=1
pkgdesc="Allows TT-RSS API clients to request downscaled images"
arch=('any')
url="https://git.tt-rss.org/fox/ttrss-api-resize"
license=('GPL3')
depends=('tt-rss' 'php-gd')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	installdir="${pkgdir}/usr/share/webapps/tt-rss/plugins/api_resize_media"
	install -m 755 -d "${installdir}"
	cd "$srcdir/${pkgname%-git}"
	cp -R * "${installdir}"
	find "${installdir}" -type d -exec chmod 755 '{}' \; -type f -exec chmod 644 '{}' \;
}
