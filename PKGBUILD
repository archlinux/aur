# Maintainer: Jeff_WuYo <62562200+Jeff-WuYo@users.noreply.github.com>
# Contributor: The-Repo-Club <The-Repo-Club@github.com>
pkgname=qt6gtk2
pkgver=0.6
pkgrel=1
pkgdesc='GTK+2.0 integration plugins for Qt6'
arch=('any')
groups=('therepoclub')
url='https://www.opencode.net/trialuser/qt6gtk2'
license=(GPL2)
conflicts=($pkgname-git)
depends=(qt6-base gtk2 libx11)
source=("${pkgname}-$pkgver.tar.gz::${url}/-/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        "${pkgname}.hook")
sha256sums=('123fcb8260db5c22bb25a1954db02b6390e73eaed3ad13850cce641ea300fd78'
            '9c60620868ce7dc469985cdde56332e28ce9f60dd13d6dfa516e8d1ef94c7673')

build() {
  cd $pkgname-$pkgver
  /usr/lib/qt6/bin/qmake6 PREFIX=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make INSTALL_ROOT="$pkgdir" install
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 "$srcdir/${pkgname}.hook" "$pkgdir/usr/share/libalpm/hooks/90-${pkgname}.hook"
}
