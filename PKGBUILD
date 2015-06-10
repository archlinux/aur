# Maintainer: 404
# Contributor: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Artificial Intelligence <polarbeard@gmail.com>

pkgname=rollemup
pkgver=1.00
pkgrel=4
pkgdesc="Pinball game that was originally made by LostBoys for the Dutch brewery Dommelsch"
arch=('i686' 'x86_64')
url='http://happypenguin.altervista.org/gameshow.php?t=Roll%20%27m%20Up'
license=('custom: freeware')
install=rollemup.install
depends=('sh' 'libxext')
optdepends=('alsa-oss: oss emulation for alsa audio output')
if [ "$CARCH" = "x86_64" ]; then
  depends=('sh' 'lib32-libxext')
  optdepends=('lib32-alsa-oss: oss emulation for alsa audio output')
fi
#old source files (in case pro-linux.de deletes them):
#source=("ftp://ftp.tw.freebsd.org/pub/ports/distfiles/Rollemup.tar.gz"
#        "http://archive.fedoraproject.org/pub/archive/fedora/linux/core/3/i386/os/Fedora/RPMS/compat-libstdc++-8-3.3.4.2.i386.rpm"
source=("http://www.pro-linux.de/files/rollemup/Rollemup.tar.gz"
        "http://www.pro-linux.de/files/rollemup/libstdc++.so.2.8"
        "$pkgname.sh"
        "$pkgname.png"
        "$pkgname.desktop")
sha256sums=('3419c7b170d24e6c33ef583f8cab7003199cd594ce9d3a3f3e8a8607184ea272'
            '51481e2aaea55bfe3b69b5819257c7a0057c4e4331f5ad0a904e481b41da73af'
            'f7ce27a6cb5464f7ed7fb3220dd9cac4e092f16ec4ff54aa2540915cee2046d1'
            '2d4f80685c1c50305e3c7110b99c19b83383e6ab768b2ef7d34a179860da4cc7'
            'f4daca476233dfc872c5b4ab738a21d55fb06ff83d68e53873491fcb000aa70d')

package() {
  # binary
  install -Dm755 Rollemup/Rollemup "$pkgdir"/opt/rollemup/Rollemup
  # data
  cp -r Rollemup/{Upload,Media} "$pkgdir"/opt/rollemup
  # ancient libstdc++
  install -Dm755 libstdc++.so.2.8 "$pkgdir"/opt/rollemup/lib/libstdc++.so.2.8
  # doc
  install -Dm644 Rollemup/README "$pkgdir"/usr/share/doc/$pkgname/README
  # desktop entry
  install -Dm644 $pkgname.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  # launcher
  install -Dm755 rollemup.sh "$pkgdir"/usr/bin/rollemup
}
