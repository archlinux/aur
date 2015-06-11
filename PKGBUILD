pkgname=xcursor-ize-vision
pkgver=0.git
pkgrel=1
pkgdesc="a couple of X cursor that similar to Windows 7 cursor."
url='https://github.com/izmntuk/xcursor-ize-vision'
arch=('any')
license=('GPL3')
source=('git+https://github.com/izmntuk/xcursor-ize-vision.git')
makedepends=('bash' 'xorg-xcursorgen' 'git')
md5sums=('SKIP')

pkgver() {
	cd ${srcdir}/${pkgname}
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
	cd "${srcdir}/${pkgname}"
	./makexmc.sh
	rm -r original-cursors-png makexmc.sh
}

package() {
	mkdir -p "${pkgdir}/usr/share/icons/ize-vision"
	cp "${srcdir}/${pkgname}/index.theme" "${pkgdir}/usr/share/icons/ize-vision"
	cp -r "${srcdir}/${pkgname}/cursors" "${pkgdir}/usr/share/icons/ize-vision"
	find "${pkgdir}/usr/share/icons/ize-vision" -type d -exec chmod 755 '{}' \;
	find "${pkgdir}/usr/share/icons/ize-vision" -type f -exec chmod 644 '{}' \;
}
