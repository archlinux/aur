#Autor: Pablo Novara - Zaskar
#Maintainer: mncarbone <mncarbone@gmail.com>
pkgname=pseint
pkgver=20160413
pkgrel=1
pkgdesc="A tool for learning programming basis with a simple spanish pseudocode"
arch=('i686' 'x86_64')
url="http://pseint.sourceforge.net"
license=('GPL')
groups=()
depends=('libpng12')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
download_url='http://ufpr.dl.sourceforge.net/project'
if [ "${CARCH}" = 'x86_64' ]; then
    pkgarch="l64"
    md5="9c374028e25e6fca29a3fa4aad46a2af"
elif [ "${CARCH}" = 'i686' ]; then
    pkgarch="l32"
    md5="52a5842a1d5194039fae8df15d995395"
fi
source=(http://ufpr.dl.sourceforge.net/project/${pkgname}/${pkgver}/$pkgname-${pkgarch}-${pkgver}.tgz)
noextract=()
md5sums=("${md5}")

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
