# Maintainer: taotieren <admin@taotieren.com>

pkgname=alist-desktop-bin
pkgver=3.41.0
pkgrel=1
pkgdesc="File list program that supports multiple storage"
arch=('x86_64')
url="https://github.com/AlistGo/desktop-release"
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
license=('AGPL-3.0-only')
depends=(
    'cairo'
    'gcc-libs'
    'gdk-pixbuf2'
    'glibc'
    'glib2'
    'gtk3'
    'rclone'
    'hicolor-icon-theme'
    'libsoup'
    'openssl-1.1'
    'webkit2gtk'
    #AUR
    'alist')
makedepends=('libarchive')
backup=()
options=('!strip' '!debug')
source=("${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('24da95e5444785f0ae0e543c1572e0716832dd39613a0fd67a2aa033670eb06f')
noextract=("${pkgname%-bin}_${pkgver}_amd64.deb")

package() {
    cd "$srcdir"/
    mkdir -pv ${pkgname%-bin}_${pkgver}_amd64
    bsdtar -xf ${pkgname%-bin}_${pkgver}_amd64.deb -C ${pkgname%-bin}_${pkgver}_amd64
    cd ${pkgname%-bin}_${pkgver}_amd64
    bsdtar -xf data.tar.gz --numeric-owner -C ${pkgdir}/
    chown -R root:root ${pkgdir}
    rm -rf ${pkgdir}/usr/bin/{alist,rclone}
}
