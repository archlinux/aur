# Maintainer: Miguel Useche <migueluseche@skatox.com>
# Contributor: mncarbone <mncarbone@gmail.com>
# Contributor: Cristophero <cristophero.alvarado@gmail.com>
pkgname=pseint
pkgver=20180801
pkgrel=1
pkgdesc="A tool for learning programming basis with a simple spanish pseudocode"
arch=('i686' 'x86_64')
url="http://pseint.sourceforge.net"
license=('GPL')
groups=()
depends=('libpng12' 'glu')
makedepends=()
optdepends=()
if [ "${CARCH}" = 'x86_64' ]; then
    _pkgarch="l64"
    _sha256sum="a2918fc88621b33c48fa895816e509f252aa849a49ace6173c22b098a32618cc"
elif [ "${CARCH}" = 'i686' ]; then
    _pkgarch="l32"
    _sha256sum="67e225ae81c2a2a5d88db374bfe81de8bdb880f5e3452e6ca3796d7b6ef0f8f2"
fi
source=(https://razaoinfo.dl.sourceforge.net/project/${pkgname}/${pkgver}/$pkgname-${_pkgarch}-${pkgver}.tgz)
noextract=()
sha256sums=("${_sha256sum}")

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
