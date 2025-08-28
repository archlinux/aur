# Maintainer: taotieren <admin@taotieren.com>

pkgname=openlist-desktop-bin
_pkgname=OpenList.Desktop
pkgver=0.7.0
pkgrel=1
pkgdesc="A desktop application for OpenList"
arch=('x86_64')
url="https://github.com/OpenListTeam/OpenList-Desktop"
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
license=('GPL-3.0-only')
depends=(
    'cairo'
    'gcc-libs'
    'gdk-pixbuf2'
    'glibc'
    'glib2'
    'gtk3'
    'rclone'
    'hicolor-icon-theme'
    'libsoup3'
    'openssl'
    'webkit2gtk-4.1'
    #AUR
    'openlist')
makedepends=('libarchive')
backup=()
options=('!strip' '!debug')
source=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('aa650927760fc4095fe4867169962fc1dfbe5e769705277e48a24c2e5ebdcc18')
noextract=("${_pkgname}_${pkgver}_amd64.deb")

package() {
    cd "$srcdir"/
    mkdir -pv ${_pkgname}_${pkgver}_amd64
    bsdtar -xf ${_pkgname}_${pkgver}_amd64.deb -C ${_pkgname}_${pkgver}_amd64
    cd ${_pkgname}_${pkgver}_amd64
    bsdtar -xf data.tar.gz --numeric-owner -C ${pkgdir}/
    chown -R root:root ${pkgdir}
    rm -rf ${pkgdir}/usr/bin/{openlist,rclone}
}
