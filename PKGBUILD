# Maintainer: Kostas Kardaras <kostas.kardaras at gmail dot com>

pkgname=gnome-shell-extension-radio-git
pkgver=r361.bd11de7
pkgrel=1
pkgdesc="Gnome shell extension for listening to internet radio streams"
arch=('any')
url="https://github.com/hslbck/gnome-shell-extension-radio"
license=('GPL-3.0')
depends=('gnome-shell')
makedepends=('git')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${pkgname}"

	sh build.sh
  bsdtar -xf radio@hslbck.gmail.com.shell-extension.zip -C radio@hslbck.gmail.com
}

package() {
	cd "${srcdir}/${pkgname}"

	install -dm755 "${pkgdir}/usr/share/gnome-shell/extensions"
	cp -a "radio@hslbck.gmail.com" "${pkgdir}/usr/share/gnome-shell/extensions"
}
