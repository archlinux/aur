# Maintainer: Dan McCurry <dan.mccurry at linux dot com>
pkgname=gnome-shell-extension-slide-for-keyboard-git
_pkgname=${pkgname%-git}
pkgver=r6.da19b12
pkgrel=1
pkgdesc="Shows virtual keyboard with a slide from the bottom screen edge."
arch=('any')
url="https://github.com/schuhumi/gnome-shell-extension-slide-for-keyboard"
license=('GPL')
depends=('gnome-shell')
makedepends=('git')
source=("git+https://github.com/schuhumi/gnome-shell-extension-slide-for-keyboard")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	_uuid='slideforkeyboard@simon.schumann.web.de'
	mkdir -p "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
	cd "$srcdir/$_pkgname/src"

	install -Dm644 "metadata.json" \
		"${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/metadata.json"
	install -Dm644 "extension.js" \
		"${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/extension.js"
	install -Dm644 "stylesheet.css" \
		"${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/stylesheet.css"
}
