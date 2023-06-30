# Maintainer: arti
# Maintainer: redtide <redtid3@gmail.com>
# Contributor: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=wdisplays
pkgver=1.1
pkgrel=2
pkgdesc='GUI display configurator for wlroots compositors'
url='https://github.com/artizirk/wdisplays'
license=('GPL')
provides=('wdisplays')
arch=('x86_64')
depends=('gtk3' 'libepoxy' 'wayland' 'wayland-protocols')
makedepends=('meson')
source=(
  $pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz
  icon-rename.patch::$url/pull/1.patch
  fix-overlay.patch::$url/pull/2.patch
)
sha512sums=('1aabcb4fef1bde1b8f6bb9254804bba39fe5ebdd57ecc62894aca432527be54ead39ece4008f48ddf96a28111fc409fa5a093905c8017b79bb3f6495a0dc264d'
            '0a6c446288cec57d78e6d1ef3681df5c8cf09a2d8e6ba4c118413a57b4d2390e918adc7701618e5ba90afaa31af92e10f637144dc4397521a2671b9066ab9ec1'
            '6f9839260cad2139c75b3f8ff1d78f6dc9f13a212da5d2d9fac1b7aa09969d59999b51b616fe1e5cda8415ee76542da72d49df18d4e9242cad00eacf6566c3e6')
b2sums=('438030d835a0b01dc65c9e69ef0019ce53741aa3be63624ffd73d7cd44e37ccb102cbc4aedaa303d7f47267353640072b3de76437f45637abfd2192b612b23ad'
        '959f7fefb97898d367d2b4c21f87c7b98a1d6247b01cfda3a8576c79738e8540563484ae462f53026ca5764e31691c4ff25fc9098c28e5eb32612bae94402ca1'
        '090a87f200fea41bcf3234cf8f0577b9a9cde16844b22d7a4bd135d4464db482facb85c95094f7781e8fe890d96aeee01f323d5261516fcee0aa1bec192cadbd')

prepare() {
  patch -Np1 -d $pkgname-$pkgver -i ../icon-rename.patch
  patch -Np1 -d $pkgname-$pkgver -i ../fix-overlay.patch
}

build() {
  cd "$pkgname-$pkgver"
  arch-meson "$srcdir/build"
  ninja -C "$srcdir/build"
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="$pkgdir" ninja -C "$srcdir/build" install
}
