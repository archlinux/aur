# Maintainer: Steven Seifried <gitlab@canox.net>
# Contributor: Steven Seifried <gitlab@canox.net>
pkgname=spdynu
_pkgbase=spdynu
pkgver=2018.11
pkgrel=2
pkgdesc="DynDNS Client for spdyn.de"
url="https://github.com/StevenSeifried/spdynu"
license=("GPL2")
arch=('any') 
makedepends=('git' 'gcc' 'make')
depends=('make' 'gcc')
conflicts=('spdynu-git')
source=("https://github.com/StevenSeifried/spdynu/archive/2018.11.tar.gz")
sha256sums=('ea2878e5b468e0d56c0e6c7f1691f849e9006255d4503b3942480f70a6cb2409')
sha512sums=('c707f61929e2ebbe25f3eafc392de100084d75c0d0e59ed254de9f7c25ee6a7abbd83efacf029017f10f13e074e01b37997723180a2b4d17b0b8bdaec683f802')
build() {
 gcc $srcdir/$pkgname-$pkgver/spdynUpdater.c -o $srcdir/$pkgname-$pkgver/spdynu
}
package() {
 wget https://github.com/StevenSeifried/spdynu/raw/master/aur/spdynu-aur.service -O $srcdir/$pkgname-$pkgver/spdynu-aur.service
 install -Dm755 "$srcdir/$pkgname-$pkgver/spdynu" "${pkgdir}/usr/bin/spdynu"
 install -Dm755 "$srcdir/$pkgname-$pkgver/spdynu.conf" "${pkgdir}/etc/spdynu.conf"
 install -Dm755 "$srcdir/$pkgname-$pkgver/spdynu-aur.service" "${pkgdir}/etc/systemd/system/spdynu.service"
 install -Dm755 "$srcdir/$pkgname-$pkgver/spdynu.timer" "${pkgdir}/etc/systemd/system/spdynu.timer"
 echo -e "\033[31m\033[1m\033[4mThe systemd Service and Timer must be manually enabled and started\033[0m"
 echo -e "\033[31m\033[1m\033[4mDon't forget to edit /etc/spdynu.conf\033[0m"
}

