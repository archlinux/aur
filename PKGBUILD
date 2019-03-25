# Maintainer: David Rodriguez <dissonant.tech@gmail.com>

pkgname=lightdm-webkit-theme-archlinux
_pkgname=archlinux
pkgver=0.5.0
_bgver=0.6
pkgrel=2
pkgdesc="ArchLinux version of the official Antergos greeter"
arch=('any')
url="https://github.com/Dissonant-Tech/lightdm-webkit-theme-archlinux"
license=('GPLv2')
depends=('lightdm' 'lightdm-webkit2-greeter')
install=theme.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Dissonant-Tech/${pkgname}/archive/${pkgver}.tar.gz"
        "http://antergos.com/antergos-wallpapers-${_bgver}.zip")
md5sums=('fd3885f57962eb3a6760b60fab87ed5d'
            'c996d26914e71897019c33854b0ae634')

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
