# Maintainer: Nate Hart <nejthan; gmail>

pkgname=lightdm-webkit-theme-tendou
_pkgname=tendou
pkgver=1.1
pkgrel=2
pkgdesc="A Windows 10 inspired theme for the LightDM WebKit greeter"
arch=('any')
url="https://github.com/nejsan/lightdm-webkit-theme-tendou"
license=('MIT')
depends=('lightdm' 'lightdm-webkit2-greeter')
confilcts=('lightdm-webkit-theme-tendou')
install=theme.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nejsan/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('2fa849521697812d0e1eb6df0aec0bb5cf3411183189dad5d249d1ff1196a465')

build()
{
	cd ${srcdir}/${pkgname}-${pkgver}
    sed -i 's%/usr/share/%/usr/share/lightdm-webkit/themes/%g' index.html
}

package()
{
	cd ${pkgdir}
	mkdir -p usr/share/lightdm-webkit/themes
	cd usr/share/lightdm-webkit/themes
	cp -dpr --no-preserve=ownership ${srcdir}/${pkgname}-${pkgver} ${_pkgname}
	msg "Removing .git files"
	cd ${_pkgname}
	rm -rf .gitignore
}
