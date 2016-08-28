# Maintainer: Kate Hart <kejt.hart; gmail>

pkgname=lightdm-webkit-theme-wisp
_pkgname=wisp
pkgver=1.2
pkgrel=2
pkgdesc="An airy theme for the LightDM WebKit greeter"
arch=('any')
url="https://github.com/codehearts/lightdm-webkit-theme-wisp"
license=('MIT')
depends=('lightdm' 'lightdm-webkit2-greeter')
confilcts=('lightdm-webkit-theme-wisp')
install=theme.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/codehearts/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('31989b30660b44bc7750d6116d40903f9378702c3f8c858a67b79900a67139a5')

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
