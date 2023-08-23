# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Dany Martineau <dany.luc.martineau at gmail.com>
# Contributor: Larryhaja  <larryhaja at gmail.com>

pkgname=methane
pkgver=2.0.1
pkgrel=1
pkgdesc="Help the Super Methane Brothers to capture baddies with your gas gun"
arch=('i686' 'x86_64')
url="http://methane.sourceforge.net"
license=('GPL')
depends=('clanlib=4.1.0' 'libmikmod')
source=($pkgname-$pkgver.tar.gz::"https://github.com/rombust/Methane/archive/refs/tags/v$pkgver.tar.gz"
        $pkgname.png
        $pkgname.desktop)
sha256sums=('8a6df09f82d3b9404821adff2c2a13012e623abdd57591bf2503dd1e4ff3cac2'
            '6c56b025b058a954bd089850dc50f4f25b292da97bbba0d4315db4060152f1fe'
            'a1673c549854334bfaff0c5fffec4388952eacd6aa2709ab02562e1edd1266d1')

build() {
  make -C Methane-$pkgver
}

package() {
  # install desktop entry
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm644 $pkgname.png "$pkgdir"/usr/share/pixmaps/$pkgname.png

  cd Methane-$pkgver

  # install data and executable
  install -d "$pkgdir"/usr/share/$pkgname
  cp -r {resources,docs} "$pkgdir"/usr/share/$pkgname
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
