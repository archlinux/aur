# Maintainer: Miguel Useche <migueluseche@skatox.com>
# Contributor: mncarbone <mncarbone@gmail.com>
pkgname=pseint
pkgver=20180202
pkgrel=2
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
    _sha256sum="7f5faa531670999e6ca37c039c0f133398e2ba1ef5215272c93ce815d358be57"
elif [ "${CARCH}" = 'i686' ]; then
    _pkgarch="l32"
    _sha256sum="da8656142c4ef5179a2b3c874ca1c6dec6b37bd784abd41cead1c13a550e7351"
fi
source=(http://downloads.sourceforge.net/project/${pkgname}/${pkgver}/$pkgname-${_pkgarch}-${pkgver}.tgz)
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
