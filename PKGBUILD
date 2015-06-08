# Maintainer: Antergos Devs <dev@antergos.com>

pkgname=lightdm-webkit-theme-antergos
_pkgname=antergos
pkgver=2.1.0
_bgver=0.6
pkgrel=2
pkgdesc="The official greeter theme of Antergos Linux"
arch=('any')
url="http://www.antergos.com"
license=('GPLv2')
depends=('lightdm' 'lightdm-webkit2-greeter')
confilcts=('lightdm-webkit-theme-antergos-git')
install=theme.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Antergos/${pkgname}/archive/${pkgver}.tar.gz"
        "http://antergos.com/antergos-wallpapers-${_bgver}.zip")
sha256sums=('5f963e0a22022cac820c99d51c264c6188096d8055ecbab1131bb340973ec165'
            '383484231d5d4c1e785d8b5e7635909e3e3200a9fe18fef5dbc6fc2f23961b28')

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
      cp -dpr --no-preserve=ownership "${srcdir}/antergos-wallpapers-${_bgver}" wallpapers
}
