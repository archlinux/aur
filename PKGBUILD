# Maintainer: Frede Hundewadt <fh@uex.dk>

pkgname=piclone-git
pkgver=r146.71b0bcb
pkgrel=1
pkgdesc="Raspberry Pi system clone utility"
arch=(x86_64 i686 armv7h aarch64)
url="https://github.com/raspberrypi-ui/piclone"
license=(GPL2)
depends=(gtk3 glib2 parted dosfstools e2fsprogs coreutils util-linux zenity dbus gvfs)
makedepends=(git intltool)
source=("git+https://github.com/raspberrypi-ui/piclone.git")
sha256sums=('SKIP')

pkgver() {
    cd piclone
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd piclone
    ./autogen.sh
}

build() {
    cd piclone
    ./configure --prefix=/usr
    make
}

package() {
    cd piclone
    make DESTDIR="${pkgdir}/" install
    install -D -t "${pkgdir}/usr/lib/piclone/" data/pwdpic.sh
}
