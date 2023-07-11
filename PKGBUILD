# Maintainer: Frede Hundewadt <echo ZmhAbWFuamFyby5vcmcK | base64 -d>
pkgname=piclone
pkgver=0.5
pkgrel=4
pkgdesc="Raspberry Pi system clone utility"
arch=("any")
url="https://github.com/raspberrypi-ui/${pkgname}"
license=('GPL')
depends=("parted" "dosfstools" "e2fsprogs" "coreutils" "util-linux" "zenity" "dbus" "gvfs")
makedepends=("git" "intltool" "gtk3" "glib2")
source=("git+https://github.com/raspberrypi-ui/${pkgname}.git" "arch.patch")

prepare() {
    cd "$srcdir/$pkgname"
    patch -N -p1 < ${srcdir}/arch.patch
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
            'eb60096d5f34f31eef08acb36af7590bcb5a0ddf5b2b22852f986d9b24d54357')
