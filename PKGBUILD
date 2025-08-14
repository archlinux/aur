# Maintainer: Léo <salut_c_leo at proton dot me>

pkgname=badwolf
pkgver=1.4.0
pkgrel=1
pkgdesc="A minimalist and privacy-oriented WebKitGTK+ browser."
url="https://hacktivis.me/projects/badwolf"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
license=('BSD')
makedepends=('ninja' 'ed')
depends=('webkit2gtk-4.1' 'libxml2')
source=("https://distfiles.hacktivis.me/releases/badwolf/$pkgname-$pkgver.tar.gz")
sha512sums=('5528572fab02b36727b90dce5ec758862c684777bef291c70b99bae0941debd20f717a7d50942152e3f7017c900a5c8fec8e825c86a18f499e7f35bb37c02d0c')
changelog=changelog

build() {
  cd "$pkgname-$pkgver"
  PREFIX=/usr WITH_WEBKITGTK=4.1 WITH_URI_PARSER=guri ./configure
  ninja
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
  DESTDIR="${pkgdir}/" ninja install
}
