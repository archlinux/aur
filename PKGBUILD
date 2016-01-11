# Maintainer: Dustin Falgout <dustin@antergos.com>

pkgname=lightdm-webkit-theme-antergos
_pkgname=antergos
_holdver=2.2.3
_pkgver=2.3.2
pkgver="${_holdver}_${_pkgver}"
_bgver=0.6
pkgrel=1
pkgdesc="Theme for LightDM Webkit Greeter. For use with the legacy webkit1 greeter."
arch=('any')
url="https://github.com/Antergos/${pkgname}"
license=('GPL')
depends=('lightdm-webkit-greeter')
confilcts=('lightdm-webkit2-greeter')
install=theme.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Antergos/${pkgname}/archive/${_pkgver}.tar.gz"
		"http://antergos.com/antergos-wallpapers-${_bgver}.zip")
md5sums=('b92e0b7b0f34dd2b60f89a62ca3bf4ae'
         'c996d26914e71897019c33854b0ae634')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	sed -i 's%/usr/share/%/usr/share/lightdm-webkit/themes/antergos/%g' index.html
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -dm755 "${pkgdir}/usr/share/lightdm-webkit/themes"
	cp -dpr --no-preserve=ownership "${srcdir}/antergos-wallpapers-${_bgver}" wallpapers
	cp -dpr --no-preserve=ownership \
		"${srcdir}/${pkgname}-${pkgver}" \
		"${pkgdir}/usr/share/lightdm-webkit/themes/${_pkgname}"
}
