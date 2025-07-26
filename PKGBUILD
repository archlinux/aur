# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: sausageandeggs <sausageandeggs@archlinux.us>
# Contributor: Thomas Dziedzic <gostrc@gmail.com>
# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>

pkgname=gnofract4d
pkgver=4.4
pkgrel=1
pkgdesc='Create beautiful fractal images'
arch=(any)
url=https://fract4d.github.io/gnofract4d
license=(BSD)
depends=(gtk4 libjpeg libpng libxml2 python-cairo python-gobject)
makedepends=(git meson)
optdepends=('ffmpeg: to create videos')
checkdepends=(python-pytest)
source=("$pkgname-$pkgver.tar.xz::https://github.com/fract4d/gnofract4d/releases/download/v$pkgver/gnofract4d-$pkgver.tar.xz")
sha256sums=('38818711bb01c0f4a5a534c7b864436b18939e53412b3fd6c809bd576f746c0c')

build() {
  cd $pkgname-$pkgver
  #arch-meson _build
  meson setup --prefix=/usr --buildtype=plain _build
  meson compile -C _build
}

check() {
  cd $pkgname-$pkgver
  #meson test -C build
  ./test.py
}

package() {
  cd $pkgname-$pkgver
  #install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 doc/$pkgname.1 -t "$pkgdir/usr/share/man/man1"
  meson install -C _build --destdir "$pkgdir"
}
