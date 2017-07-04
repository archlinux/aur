# Maintainer: Bruce Zhang <zttt183525594@gmail.com>
pkgname=wineqq-longene
pkgver=20151109
pkgrel=6
epoch=
pkgdesc="Longene Wine QQ 7.8."
arch=('i686' 'x86_64')
url="http://www.longene.org/"
license=('unknown')
groups=()
depends=('lib32-glib2' 'lib32-gtk3')
makedepends=('tar')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=wineqq-longene.install
source=("http://www.longene.org/download/WineQQ7.8-${pkgver}-Longene.deb")
noextract=("WineQQ7.8-${pkgver}-Longene.deb")
md5sums=('ababd6828bc04f130d29c6cef9f252a7')
_desktop="qq-test.desktop"

prepare() {
	ar -x "WineQQ7.8-${pkgver}-Longene.deb"
	mkdir "${pkgname}-${pkgver}"
	tar -zxf data.tar.gz --directory="${pkgname}-${pkgver}"	
        cd "${pkgname}-${pkgver}/opt/longene/qq"
        tar jxvf wine-lib.tar.bz2
}

package() {
	cd "${pkgname}-${pkgver}"
	find ./opt -type f -exec install -Dm777 {} \
            "${pkgdir}/{}" \;
	install -Dm777 "${srcdir}/${pkgname}-${pkgver}/usr/share/applications/${_desktop}" "${pkgdir}/usr/share/applications/${_desktop}"
}
