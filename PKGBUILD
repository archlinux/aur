# Maintainer: David Stark <david@starkers.org>
pkgname=snx-800007075
pkgver=800007075
pkgrel=1
pkgdesc="Check Point SSL Network Extender (vpn client) [locked to version: 800007075]"
arch=('x86_64')
url=""
license=('GPL')
groups=()
depends=('lib32-pam' 'lib32-libstdc++5' 'lib32-libx11')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=snx.install
changelog=
source=("https://starkers.keybase.pub/snx_install_linux30.sh?dl=1")
noextract=("${source[@]%%::*}")
md5sums=('4372e9936e2dfb1d1ebcef3ed4dd7787')

build() {
    cd "$pkgname-$pkgver"
}

prepare() {
    mkdir "$pkgname-$pkgver"

    # ARCHIVE_OFFSET FROM snx_install.sh FILE
    ARCHIVE_OFFSET=78
    tail -n +$ARCHIVE_OFFSET "snx_install_linux30.sh?dl=1" >snx.tar.bz2

    cd "$pkgname-$pkgver"
    tar -xvf ../snx.tar.bz2
}


package() {
    cd "$pkgname-$pkgver"
    install --directory --owner=root --group=root --mode=u=rwx,g=rx,o=rx $pkgdir/usr/bin
    install --owner=root --group=root --mode=u=rxs,g=x,o=x snx $pkgdir/usr/bin/snx
    install --owner=root --group=root --mode=u=rx,g=rx,o=rx snx_uninstall.sh $pkgdir/usr/bin/snx_uninstall
    install --directory --owner=root --group=root --mode=u=rwx $pkgdir/etc/snx
    install --directory --owner=root --group=root --mode=u=rwx $pkgdir/etc/snx/tmp
}

