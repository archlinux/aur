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
    mkdir -p "${pkgdir}/opt/pseint"
    cp -rv "${srcdir}/pseint/"* "${pkgdir}/opt/pseint"
    mkdir -p "${pkgdir}/usr/share/applications/"
    desktopfile="${pkgdir}/opt/pseint/pseint.desktop"
    touch $desktopfile
    echo "[Desktop Entry]" >> $desktopfile
    echo "Name=PSeInt en GNU/Linux" >> $desktopfile
    echo "GenericName=PSeInt" >> $desktopfile
	echo "Comment=Una herramienta para aprender las bases de la programación mediante pseudocodigo en español" >> $desktopfile
    echo "Type=Application" >> $desktopfile
    echo "Exec=pseint" >> $desktopfile
    echo "Icon=/opt/pseint/imgs/icon.icns" >> $desktopfile
    echo "Terminal=false" >> $desktopfile
    echo "Categories=Development" >> $desktopfile

    mkdir -p "${pkgdir}/usr/share/applications/"
    cp $desktopfile "${pkgdir}/usr/share/applications/"

    cp $desktopfile ~/.local/share/applications

    mkdir -p "${pkgdir}/usr/bin/"
    touch "${pkgdir}/usr/bin/pseint"
    echo "#!/usr/bin/env sh" >> "${pkgdir}/usr/bin/pseint"
    echo "/opt/pseint/wxPSeInt" >> "${pkgdir}/usr/bin/pseint"
    chmod +x "${pkgdir}/usr/bin/pseint"
}
