# Maintainer: Your Name <youremail@domain.com>
pkgname=snx
pkgver=800007097
pkgrel=2
pkgdesc="Check Point SSL Network Extender (vpn client)"
arch=('x86_64')
url=""
license=('GPL')
groups=()
depends=('lib32-pam>=1.2.1' 'lib32-libstdc++5>=3.3.6')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=snx.install
changelog=
source=("https://vpnportal.aktifbank.com.tr/SNX/INSTALL/snx_install.sh")
noextract=("${source[@]%%::*}")
md5sums=('82b517242eab2788dceaedb6b8f952cc')

build() {
    cd "$pkgname-$pkgver"
}

prepare() {
    mkdir "$pkgname-$pkgver"

    # ARCHIVE_OFFSET FROM snx_install.sh FILE
    ARCHIVE_OFFSET=78
    tail -n +$ARCHIVE_OFFSET snx_install.sh >snx.tar.bz2

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


