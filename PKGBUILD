# Maintainer: ValHue <vhuelamo@gmail.com>
#
# Contributor: ValHue <vhuelamo@gmail.com>
#
pkgname="wp-desktop"
pkgver="6.0.0"
pkgrel="2"
pkgdesc="WordPress.com Desktop client"
url="https://desktop.wordpress.com/"
_url="https://github.com/Automattic/wp-desktop"
arch=('x86_64')
license=('GPL2')
depends=('alsa-lib' 'gcc-libs' 'gtk3' 'libgpg-error' 'libxss' 'libxkbfile' 'libxtst' 'nss')

_pkgsource="wordpress.com-linux-x64-${pkgver}.tar.gz"
source=("${_pkgsource}::${_url}/releases/download/v${pkgver}/${_pkgsource}")

sha256sums=('a727f9315b24d69aa81389f163eb79ed3f5e420410b7dbbd3f3b28aa1ea2ee26')

_wpcom_desktop="[Desktop Entry]
Version=1.0
Type=Application
Name=WordPress.com
Comment=WordPress.com Desktop Client
Exec=/opt/WordPress.com/wpcom %U
Icon=wpcom
Terminal=false
StartupWMClass=WordPress.com
StartupNotify=true
Categories=Development;"

prepare() {
    cd "${srcdir}"
    echo -e "$_wpcom_desktop" | tee wpcom.desktop
}

package() {
    cd "${srcdir}"/wordpress*/
    install -d ${pkgdir}/opt/WordPress.com
    mv * "${pkgdir}/opt/WordPress.com/"

    cd "${srcdir}"
    install -D -m644 *.desktop "${pkgdir}/usr/share/applications/wpcom.desktop"

    cd "${pkgdir}/opt/WordPress.com/"
    install -D -m644 ./resources/app/public_desktop/app-logo.png "${pkgdir}/usr/share/pixmaps/wpcom.png"
    install -D -m644 LICENSE.electron.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: set ts=4 sw=4 et syn=sh ft=sh:
