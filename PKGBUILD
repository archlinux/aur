# Maintainer: 2ion <dev@2ion.de>
pkgname=bunsen-images
pkgver=8.7
pkgrel=1
pkgdesc="BunsenLabs wallpaper collection"
arch=('any')
url="https://github.com/BunsenLabs/bunsen-images"
license=('GPL3')
provides=("$pkgname")
conflicts=("$pkgname")
makedepends=(rsync)
source=("https://codeload.github.com/BunsenLabs/bunsen-images/tar.gz/${pkgver}-${pkgrel}")
sha512sums=('5b6f840c870dabfc230e5e84d01d532f7b903d44010357d6131e3f95c0b6c58d5d92feecf3c3b9b484a0df203e3ed9f9c24f55ad2eb5dc7758bcb2fe86921b12')

package() {
  cd "$srcdir/$pkgname-$pkgver-$pkgrel"

  local _installdir="$pkgdir/usr/share/wallpapers/bunsen"
  local _docsdir="$pkgdir/usr/share/doc/$pkgname"

  install -dm755 "$_installdir" "$_docsdir"

  rsync --recursive bl-img/       "$_installdir"/
  rsync --recursive bl-img-extra/ "$_installdir"/

  install -m644 -t "$_docsdir" LICENSE README
  install -m644 -t "$_docsdir" debian/changelog debian/copyright
}
