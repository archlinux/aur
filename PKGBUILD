# Maintainer: Tesx <tesfabpel@gmail.com>

pkgname=goxel
pkgver=0.10.7
pkgrel=1
pkgdesc="3D program that lets you create voxel volumes"
arch=(x86_64)
url="https://goxel.xyz/"
license=(GPL3)
depends=(glfw gtk3)
makedepends=(scons)
source=("$pkgname-$pkgver.tar.gz::https://github.com/guillaumechereau/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('dfb91e62bdd5332e3938923db924bae43f12eaa181040d16e4cc7082316adf1c')

prepare() {
  cd $pkgname-$pkgver
  sed -i 's|scons mode=release|scons mode=release werror=n|
          s|/share/applications/goxel.desktop|/share/applications/io.github.guillaumechereau.Goxel.desktop|
          s|install -Dm744 goxel|install -Dm755 goxel|' Makefile
  sed -i 's|\${SNAP}/icon.png|goxel|' snap/gui/goxel.desktop
}

build() {
  cd $pkgname-$pkgver
  make release
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
