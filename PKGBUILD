# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: ploxiln <pierce.lopez@gmail.com>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>

pkgname=hexxagon
pkgver=1.0.2
pkgrel=2
pkgdesc='A clone of the old DOS game Hexxagon, with enhanced features and strong AI'
arch=('i686' 'x86_64')
license=('GPL')
url='http://www.nesqi.se'
depends=('gtkmm')
source=("http://nesqi.se/download/hexxagon-$pkgver.tar.bz2"
        "$pkgname.desktop"
        "$pkgname.png")
sha256sums=('49b13516822fd32a9c58d62735b841a6e47e1714273e03ad20d8a9343a7623cc'
            '673fb40dbfeb96f2594f06f1b105afd23686472d5ef380e8b07d1a0f30b1e822'
            '0405a14380a379e6502b663d9db77be8471b84aa838fe3f645e25bdbd03c78c7')

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  make -C $pkgname-$pkgver DESTDIR="$pkgdir" install

  # .desktop entry
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm644 $pkgname.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
}
