# Maintainer: Kate Hart <kejt.hart; gmail>

pkgname=lightdm-webkit-theme-tendou
_pkgname=tendou
pkgver=1.2
pkgrel=1
pkgdesc="A Windows 10 inspired theme for the LightDM WebKit greeter"
arch=('any')
url="https://github.com/codehearts/lightdm-webkit-theme-tendou"
license=('MIT')
depends=('lightdm' 'lightdm-webkit2-greeter')
conflicts=('lightdm-webkit-theme-tendou')
install=theme.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/codehearts/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('bab7f73d3b0eaeed2e5dd19befa4a9178549f44d0dff7dc7b63ab7de38ce39a5')

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
