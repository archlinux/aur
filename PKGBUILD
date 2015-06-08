# Maintainer: Veeti Paananen <veeti.paananen@rojekti.fi>
pkgname=vendace
pkgver=0.1.2
pkgrel=1
pkgdesc="Simple screenshot crop & upload"
arch=('x86_64' 'i686')
url="http://vendace.org"
license=('MIT')
depends=('qt5-base' 'libxkbcommon-x11' 'hicolor-icon-theme')
makedepends=('qt5-base' 'cmake')
install='vendace.install'
source=("https://github.com/veeti/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('bf98e1cafce4eb9c2e54271d9272072e07915dbe6744a23f43327fe5bb0f908e')

build() {
  cd "$pkgname-$pkgver"

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -D -m644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}

