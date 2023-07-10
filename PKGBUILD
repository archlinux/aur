# Maintainer: Your Name <youremail@domain.com>
pkgname=piclone
pkgver=0.5
pkgrel=2
pkgdesc="Raspberry Pi system clone utility"
arch=("any")
url="https://github.com/raspberrypi-ui/${pkgname}"
license=('GPL')
depends=("parted" "dosfstools" "e2fsprogs" "coreutils" "util-linux" "zenity" "dbus")
optdepends=("gvfs")
makedepends=("git" "intltool" "gtk3" "glib2")
source=("git+https://github.com/raspberrypi-ui/${pkgname}.git" "locale_uuidgen.patch")

prepare() {
    cd "$srcdir/$pkgname"
    patch -N -p1 < ${srcdir}/locale_uuidgen.patch
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
            '38f7e350f4e76479cc5ad53046ea9753d13116f5a1af7c1780fb3ac2181a9b7d')
