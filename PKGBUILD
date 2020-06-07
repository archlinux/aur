# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: archus <archus@archlinux.cba.pl>

pkgname=streamtuner2
pkgver=2.2.1
pkgrel=1
pkgdesc="An internet radio browser"
arch=('any')
url="https://sourceforge.net/projects/streamtuner2/"
license=('custom:public domain')
depends=(gtk3 python-dbus python-gobject python-pillow python-pyquery python-pyxdg python-requests youtube-dl)
source=("https://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.src.txz"
        "streamtuner2-make.patch")
sha256sums=('30aa66fa9bc314c8161fdcb1fddba57fdd3b6b910acf4f07de1d59366bdd024b'
            '6e20484cc250204f8d37582087405c734998ea4d3c42cef9b55f50db756cc3e2')

prepare() {
  cd $pkgname
  patch -Np1 -i ../streamtuner2-make.patch
  gzip -dc > gtk3.xml < gtk3.xml.gz
}

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  install -Dm644 CREDITS "$pkgdir/usr/share/licenses/$pkgname/CREDITS"
}
