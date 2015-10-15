# Maintainer: Antergos Devs <dev@antergos.com>

pkgname=lightdm-webkit-theme-antergos
_pkgname=antergos
pkgver=2.2
_bgver=0.6
pkgrel=1
pkgdesc="The official greeter theme of Antergos Linux"
arch=('any')
url="http://www.antergos.com"
license=('GPLv2')
depends=('lightdm-webkit2-greeter')
confilcts=('lightdm-webkit-theme-antergos-git')
install=theme.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Antergos/${pkgname}/archive/${pkgver}.tar.gz"
        "http://antergos.com/antergos-wallpapers-${_bgver}.zip")
sha256sums=('f496ce25b439cb442e36a7a4c70929764247847494f065bcf42d5c58be080569'
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
