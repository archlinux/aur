# Maintainer: Vain <aurmaint1 on host: uninformativ dot de>
pkgname=lariza-git
pkgver=20.08.1.g3a7f696
pkgrel=1
pkgdesc="Simple WebKit2GTK+ Browser"
arch=('i686' 'x86_64')
url="https://uninformativ.de/git/lariza"
license=('MIT')
depends=('webkit2gtk')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=lariza.install
source=('git+https://uninformativ.de/git/lariza.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --always | sed 's|-|.|g; s|v||'
}

build() {
  cd "$srcdir/${pkgname%-git}"
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"

  make DESTDIR="$pkgdir" prefix="/usr" install

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
