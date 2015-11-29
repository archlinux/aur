# Maintainer: Vain <aurmaint1 on host: uninformativ dot de>
pkgname=lariza-git
pkgver=15.09.5.g3fb92e0
pkgrel=1
pkgdesc="Simple WebKit2GTK+ Browser"
arch=('i686' 'x86_64')
url="https://github.com/vain/lariza"
license=('custom:PIZZA-WARE')
depends=('webkit2gtk')
makedepends=('git')
optdepends=('tabbed: for grouping multiple web views into one window')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=lariza.install
source=('git://github.com/vain/lariza.git')
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
    "$pkgdir"/usr/share/"${pkgname%-git}"/web_extensions/we_adblock.so
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
}
