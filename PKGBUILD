# Maintainer: Nate Hart <nejthan; gmail>

pkgname=lightdm-webkit-theme-wisp
_pkgname=wisp
pkgver=1.0
pkgrel=1
pkgdesc="An airy theme for the lightdm webkit greeter"
arch=('any')
url="https://github.com/nejsan/lightdm-webkit-theme-wisp"
license=('MIT')
depends=('lightdm' 'lightdm-webkit2-greeter')
confilcts=('lightdm-webkit-theme-wisp')
install=theme.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nejsan/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('bc863ccfa34aa92b3eb755f35d5727bbaaa2b4c242e9aab9fb868999f0c4b5ad')

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
