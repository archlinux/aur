# Maintainer: Artem Klevtsov <a.a.klevtsov [at] gmail [dot] com>
# Co-maintainer: Nebulosa <nebulosa2007 at yandex dot ru>

pkgname=byedpi
pkgver=0.17
pkgrel=1
pkgdesc="Bypass DPI"
arch=(aarch64 armv7h i686 x86_64)
url="https://github.com/hufrea/$pkgname"
license=(MIT)
depends=(glibc)
options=(!debug)
backup=("etc/$pkgname.conf")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('10fc6c936bdc78ce3f87ee17d7828527894974534bb1f97e1ea1eb180d89d9300fd051512d655b4bb203df83c97576ef56c5f8cebc332f631df99dde08bb996c')
b2sums=('fb3ce55bb0fb40ad10837eff031fd7fd0f472baac9e44366590fddfd4293f07c7509987938aaeb7674690286120aa8e9b1c35b7eec2af8580d59944aa202bc04')

prepare() {
  sed -i 's|ciadpi|/usr/bin/ciadpi|' $pkgname-$pkgver/dist/linux/$pkgname.service
}

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  install -vDm 644 dist/linux/$pkgname.conf -t "$pkgdir"/etc/
  install -vDm 755 ciadpi -t "$pkgdir"/usr/bin/
  install -vDm 644 dist/linux/$pkgname.service -t "$pkgdir"/usr/lib/systemd/system/
  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
