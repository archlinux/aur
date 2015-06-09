# Maintainer: Frontier (frontier314 at gmail dot com)

pkgname=wxfbe
_pkgname=wxFBE
pkgver=20140413
pkgrel=1
pkgdesc="FreeBASIC IDE based on wx-c"
arch=('i686' 'x86_64')
url="http://www.freebasic-portal.de"
license=('LGPL')
depends=('libtinfo' 'libpng12' 'lib32-libtinfo' 'lib32-libpng12' 'alsa-plugins' 'lib32-alsa-plugins')
options=(staticlibs)
source=('http://www.freebasic-portal.de/dlfiles/537/wxFBE.7z')
sha256sums=('SKIP')

build() {
7z x -y wxFBE.7z
chmod uga+xr "${srcdir}/${_pkgname}/wxFBE"
}

package() {
cd "${srcdir}/${_pkgname}"
rm *.exe *.dll
mkdir -p "${pkgdir}/opt/${pkgname}"
cp -r * "${pkgdir}/opt/${pkgname}"

cat > ${pkgname}.desktop << EoF
[Desktop Entry]
Version=${pkgver}
Encoding=UTF-8
Name=wxFBE
Comment=${pkgdesc}
Exec=/opt/${pkgname}/wxFBE
Icon=/opt/${pkgname}/images/editor.ico
Path=/opt/${pkgname}
Terminal=false
Type=Application
Categories=Development;IDE;
EoF

install -D -m 0644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
