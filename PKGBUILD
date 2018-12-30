# Maintainer: fordprefect <fordprefect@dukun.de>
pkgname=spoofer
pkgver=1.4.2
pkgrel=1
pkgdesc="client software for the spoofer internet research project on ip spoofing, BCP38 compliance"
url="https://spoofer.caida.org"
arch=('x86_64' 'i686')
license=('GPL3')
depends=("libpcap" "protobuf" "qt5-base")
optdepends=("scamper: advanced traceroute tool")
install=spoofer.install
source=("https://www.caida.org/projects/spoofer/downloads/spoofer-${pkgver}.tar.gz"
        "spoofer-gui.desktop"
        "spoofer.service"
        "Spoofer.conf"
        "spoofer.install")
sha1sums=('3a7def4ca732cde1f960a33224baef308ef8204b'
          'fe2779dcfaf0e401f3fa8d7226e7fe97a7af5b66'
          'ecbb2e4ee11288ca682e68ce5f76da4de42d4117'
          '20feb9ceffbb30d45a30d2c5e1908e4dabe2b17c'
          '01197fc6c9c8394934f1aa9891b9c5d124aa2b4e')
options=(emptydirs)

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure --prefix="/usr"
    make
}
 
package() {
    # install binaries
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install 

    # install other files
    cd ..
    install -Dm644 spoofer-gui.desktop "$pkgdir/usr/share/applications/spoofer.desktop"
    install -Dm644 spoofer.service "$pkgdir/usr/lib/systemd/system/spoofer.service"
    install -Dm644 Spoofer.conf "$pkgdir/etc/xdg/CAIDA/Spoofer.conf"
    mkdir -p "$pkgdir/var/lib/spoofer"
}
