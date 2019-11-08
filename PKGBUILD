# Maintainer: Steven Seifried <gitlab@canox.net>
# Contributor: Steven Seifried <gitlab@canox.net>
pkgname=spdynu-git
_pkgbase=spdynu
pkgver=master
pkgrel=1
pkgdesc="DynDNS Client for spdyn.de"
url="https://gitlab.com/StevenSeifried/spdynu/"
license=("GPL2")
arch=('any') 
makedepends=('git' 'gcc' 'make')
depends=('make' 'gcc')
conflicts=('spdynu')
source=("https://gitlab.com/StevenSeifried/spdynu/-/archive/master/spdynu-master.tar.gz")
sha256sums=('2892c6af7920dc9556e24230b93c3e5805586c31a249d9514810a6cdcff65c4e')
sha512sums=('46611bb1d827fa7a1a71ef985cb7c07fcb11a26f0583feb6be5a5b73d20a00cbaa1cd8376fb7615edc0d789fdc80f439b14f53b380e70b89dfced204232bba47')
build() {
 gcc $srcdir/spdynu-master/spdynUpdater.c -o $srcdir/spdynu-master/spdynu
}
package() {
 wget https://gitlab.com/StevenSeifried/spdynu/raw/master/aur/spdynu-aur.service -O $srcdir/spdynu-master/spdynu-aur.service
 install -Dm755 "$srcdir/spdynu-master/spdynu" "${pkgdir}/usr/bin/spdynu"
 install -Dm755 "$srcdir/spdynu-master/spdynu.conf" "${pkgdir}/etc/spdynu.conf"
 install -Dm755 "$srcdir/spdynu-master/spdynu-aur.service" "${pkgdir}/etc/systemd/system/spdynu.service"
 install -Dm755 "$srcdir/spdynu-master/spdynu.timer" "${pkgdir}/etc/systemd/system/spdynu.timer"
 echo -e "\033[31m\033[1m\033[4mThe systemd Service and Timer must be manually enabled and started\033[0m"
 echo -e "\033[31m\033[1m\033[4mDon't forget to edit /etc/spdynu.conf\033[0m"
}

