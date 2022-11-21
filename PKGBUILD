# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: willemw <willemw12@gmail.com>
# Contributor: ThecaTTony <thecattony at gmx dot com>
# Contributor: <giacomogiorgianni at gmail dot com>

pkgname=quiterss
pkgver=0.19.4
pkgrel=2
pkgdesc='Fast and light RSS/Atom feed reader written in Qt/С++'
arch=('x86_64')
url='https://quiterss.org/'
license=('GPL3')
depends=('gst-plugins-good' 'qt5-multimedia' 'qt5-webkit')
makedepends=('qt5-tools')
source=("https://github.com/QuiteRSS/$pkgname/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        'install-appdata.patch')
sha256sums=('d9dffa205a8ec4e7bf00d87183fd94d4a12f045fae04a6efd41d6557827233bc'
            '81cc287b8fbd53016a125f210c193c58bcac093cc86ee226c5f4fd23b26188c9')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i ../install-appdata.patch
  sed -i '/INSTALLS +=/ s/ target1//' QuiteRSS.pro
}

build() {
  cd $pkgname-$pkgver
  qmake-qt5 CONFIG+=release PREFIX=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make INSTALL_ROOT="$pkgdir" install
}
