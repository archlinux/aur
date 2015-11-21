# Maintainer: Dustin Falgout <dustin@antergos.com>

pkgname=lightdm-webkit-theme-antergos
_pkgname=antergos
pkgver=2.2.4
_bgver=0.6
pkgrel=1
pkgdesc="The official greeter theme of Antergos Linux. For use with the legacy webkit greeter."
arch=('any')
url="https://github.com/Antergos/${pkgname}"
license=('GPL')
depends=('lightdm-webkit-greeter')
confilcts=('lightdm-webkit2-greeter')
install=theme.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Antergos/${pkgname}/archive/${pkgver}.tar.gz"
		"http://antergos.com/antergos-wallpapers-${_bgver}.zip")
md5sums=('9d97e860a225c3f436ff0a310f8ede8a'
		'c996d26914e71897019c33854b0ae634')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	sed -i 's%/usr/share/%/usr/share/lightdm-webkit/themes/%g' index.html
}

package() {
	install -dm755 "${pkgdir}/usr/share/lightdm-webkit/themes"
	cp -dpr --no-preserve=ownership \
		"${srcdir}/${pkgname}-${pkgver}" \
		"${pkgdir}/usr/share/lightdm-webkit/themes/${_pkgname}"
	cp -dpr --no-preserve=ownership "${srcdir}/antergos-wallpapers-${_bgver}" wallpapers
}
