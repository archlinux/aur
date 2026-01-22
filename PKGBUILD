# Maintainer: taotieren <admin@taotieren.com>

pkgname=openlist-desktop-bin
_pkgname=OpenList.Desktop
pkgver=0.8.0
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
source=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64_linux.deb")
sha256sums=('743196e4d0218ea86eb0e0261b8ca95aafee77a811d4b03d4f12d09034883044')
noextract=("${_pkgname}_${pkgver}_amd64.deb")

package() {
    cd "$srcdir"/
    mkdir -pv ${_pkgname}_${pkgver}_amd64_linux
    bsdtar -xf ${_pkgname}_${pkgver}_amd64_linux.deb -C ${_pkgname}_${pkgver}_amd64_linux
    cd ${_pkgname}_${pkgver}_amd64_linux
    bsdtar -xf data.tar.gz --numeric-owner -C ${pkgdir}/
    chown -R root:root ${pkgdir}
    rm -rf ${pkgdir}/usr/bin/{openlist,rclone}
}
