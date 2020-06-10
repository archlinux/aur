# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=rakugaki
pkgver=1.0.5
pkgrel=1
pkgdesc="Simple drawing tool for elementary OS"
arch=(x86_64)
url="https://github.com/lainsce/rakugaki"
license=(GPL3)
depends=(granite)
makedepends=(meson vala)
source=("$pkgname-$pkgver.tar.gz::https://github.com/lainsce/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('9094dbefff61cf138636fe55c7dd611b9d766d71ad42744ca5942780910046a7')

prepare() {
  cd $pkgname-$pkgver
  sed -i 's/"edit-symbolic"/"document-edit-symbolic"/' src/Widgets/EditableLabel.vala
}

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
