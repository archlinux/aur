# Maintainer: Veeti Paananen <veeti.paananen@rojekti.fi>
pkgname=vendace-git
pkgver=0.1.2.r2.g019022c
pkgrel=1
pkgdesc="Simple screenshot crop & upload"
arch=('x86_64' 'i686')
url="http://vendace.org"
license=('MIT')
depends=('qt5-base' 'libxkbcommon-x11' 'hicolor-icon-theme')
makedepends=('qt5-base' 'cmake' 'git')
conflicts=('vendace')
provides=('vendace')
install='vendace.install'
source=('git+https://github.com/veeti/vendace.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/vendace"

  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/vendace"

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "$srcdir/vendace"

  make DESTDIR="$pkgdir/" install
  install -D -m644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}

