# Maintainer: Cristophero <cristophero.alvarado@gmail.com>
pkgname=pseint-bin
pkgver=20210408
pkgrel=1
pkgdesc="Una herramienta para aprender las bases de la programación en Español"
arch=('x86_64')
url="http://pseint.sourceforge.net"
license=('GPL')
conflicts=('pseint')
groups=()
depends=('libpng12' 'glu')
makedepends=()
optdepends=()
source=(https://razaoinfo.dl.sourceforge.net/project/pseint/${pkgver}/pseint-l64-${pkgver}.tgz)
noextract=()
md5sums=('e6ec09a10a51583a513976ece85ae917') #generar con 'makepkg -g'

package() {
    mkdir -p "${pkgdir}/opt/${pkgname}"
    cp -rv "${srcdir}/${pkgname}/"* "${pkgdir}/opt/${pkgname}"
    mkdir -p "${pkgdir}/usr/share/applications/"
    desktopfile="${pkgdir}/opt/${pkgname}/${pkgname}.desktop"
    touch $desktopfile
    echo "[Desktop Entry]" >> $desktopfile
    echo "Type=Application" >> $desktopfile
    echo "Name=PSeInt" >> $desktopfile
    echo "Comment=${pkgdesc}" >> $desktopfile
    echo "Comment[es]=Una herramienta para aprender las bases de la programación mediante pseudocodigo en español" >> $desktopfile
    echo "Exec=${pkgname}" >> $desktopfile
    echo "Icon=/opt/${pkgname}/imgs/icon.svg" >> $desktopfile
    echo "Terminal=false" >> $desktopfile
    echo "Categories=Development;IDE;" >> $desktopfile
    mkdir -p "${pkgdir}/usr/share/applications/"
    cp $desktopfile "${pkgdir}/usr/share/applications/"
    mkdir -p "${pkgdir}/usr/bin/"
    touch "${pkgdir}/usr/bin/${pkgname}"
    echo "#!/usr/bin/env sh" >> "${pkgdir}/usr/bin/${pkgname}"
    echo "/opt/${pkgname}/wxPSeInt" >> "${pkgdir}/usr/bin/${pkgname}"
    chmod +x "${pkgdir}/usr/bin/${pkgname}"
}