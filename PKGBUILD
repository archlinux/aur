# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=kdotool-bin
pkgver=0.3.0
pkgrel=1
pkgdesc='A xdotool clone for KDE Wayland (pre-compiled binary)'
arch=('x86_64')
url='https://github.com/jinliu/kdotool/'
license=('Apache-2.0')
depends=(
    'dbus'
    'glibc'
    'libgcc')
provides=('kdotool')
conflicts=('kdotool')
options=('!debug' '!strip')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/jinliu/kdotool/releases/download/v${pkgver}/kdotool-${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz"
        "https://github.com/jinliu/kdotool/archive/v${pkgver}/${pkgname%-bin}-${pkgver}.tar.gz")
noextract=("${pkgname}-${pkgver}.tar.gz")
sha256sums=('2079cc1d492b6e83e04def4d9376e34fcb36a4e3bdc637c8c2ee6fa547ce90ff'
            '78e969941b1861aad849cad9bff7c34d34268912bf8042d5b3e9fbebcbb96f6d')

prepare() {
    mkdir -p "${pkgname}-${pkgver}"
    bsdtar -x -f "${pkgname}-${pkgver}.tar.gz" -C "${pkgname}-${pkgver}"
}

package() {
    install -D -m755 "${pkgname}-${pkgver}/kdotool" -t "${pkgdir}/usr/bin"
    install -D -m644 "${pkgname%-bin}-${pkgver}/completions/kdotool.bash" "${pkgdir}/usr/share/bash-completion/completions/kdotool"
}
