# Maintainer: Your Name <youremail@domain.com>
pkgname=piclone
pkgver=0.5
pkgrel=1
pkgdesc="Raspberry Pi system clone utility"
arch=("any")
url="https://github.com/raspberrypi-ui/${pkgname}"
license=('GPL')
depends=("parted" "dosfstools" "e2fsprogs" "coreutils" "util-linux" "zenity" "dbus")
optdepends=("gvfs")
makedepends=("git" "intltool" "gtk3" "glib2")
source=("git+https://github.com/raspberrypi-ui/${pkgname}.git" "0001-add_locale_header.patch")

prepare() {
    cd "$srcdir/$pkgname"
    patch -N -p1 < ${srcdir}/0001-add_locale_header.patch

}

build() {
    cd "${srcdir}/${pkgname}"
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd "${srcdir}/${pkgname}"
    make DESTDIR="${pkgdir}/" install
    mkdir -p "${pkgdir}/usr/lib/${pkgname}/"
    install data/pwdpic.sh "${pkgdir}/usr/lib/${pkgname}/"

}

sha256sums=('SKIP'
            '3db876497efc8f9740e30b22cf3642454dc5175cf1fa5628ddc30ab4c025cda6')
