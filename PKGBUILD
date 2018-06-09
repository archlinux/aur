# Maintainer: Vain <aurmaint1 on host: uninformativ dot de>
pkgname=lariza-git
pkgver=18.03.2.g504162f
pkgrel=1
pkgdesc="Simple WebKit2GTK+ Browser"
arch=('i686' 'x86_64')
url="https://uninformativ.de/git/lariza"
license=('MIT')
depends=('webkit2gtk')
makedepends=('git')
optdepends=('tabbed: for grouping multiple web views into one window')
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

  install -Dm755 we_adblock.so \
    "$pkgdir"/usr/lib/"${pkgname%-git}"/web_extensions/we_adblock.so
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
