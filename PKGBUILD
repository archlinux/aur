# Maintainer: Nate Hart <nejthan; gmail>

pkgname=lightdm-webkit-theme-tendou
_pkgname=wisp
pkgver=1.0
pkgrel=1
pkgdesc="A Windows 10 inspired theme for the lightdm webkit greeter"
arch=('any')
url="https://github.com/nejsan/lightdm-webkit-theme-tendou"
license=('MIT')
depends=('lightdm' 'lightdm-webkit2-greeter')
confilcts=('lightdm-webkit-theme-tendou')
install=theme.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nejsan/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('f8136de0c7c53a42fc22d0b95ef672ccfcdf2f3f1017c9782e3188ef10e02c5d')

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
