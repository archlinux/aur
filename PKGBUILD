# Maintainer: "tyjak"

pkgname=binance-deb
_pkgname=binance
pkgver=1.9.2
pkgrel=1
pkgdesc="The Binance Desktop Application"
arch=('x86_64')
url="https://www.binance.com/en/download"
license=('unknown')
conflicts=('binance')
depends=()
optdepends=()
source=("https://ftp.binance.com/electron-desktop/linux/production/${_pkgname}-amd64-linux.deb")
#noextract=("${_pkgname}-amd64-linux.deb")
sha256sums=("SKIP")

prepare() {
    cd $srcdir
    bsdtar -xJf data.tar.xz
}

package() {
    mv $srcdir/opt $pkgdir
    mkdir -p $pkgdir/usr/bin
    ln -sf /opt/Binance/binance $pkgdir/usr/bin/binance
    find "${pkgdir}" -type d -exec chmod 755 {} +
}

pkgver() {
  cd $srcdir
  gunzip -cd usr/share/doc/binance/changelog.gz | head -1 | sed -e "s/^binance (\([0-9.]\+\)).*$/\1/"
}
