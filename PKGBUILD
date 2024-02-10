# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: drieck (https://aur.archlinux.org/account/dreieck)
# Contributor: frousties

pkgname=tacentview
pkgver=1.0.43
pkgrel=2
pkgdesc="An image and texture viewer for tga, png, apng, exr, dds, ktx, ktx2, astc, pkm, qoi, gif, hdr, jpg, tif, ico, webp, and bmp files. Uses Dear ImGui, OpenGL and Tacent"
url="https://github.com/bluescan/tacentview"
license=('ISC')
arch=('x86_64')
depends=('gcc-libs' 'hicolor-icon-theme' 'libx11' 'libxcb')
makedepends=('cmake' 'git' 'ninja')
source=("git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
  cmake -S $pkgname -B build -DCMAKE_BUILD_TYPE=Release -DFETCHCONTENT_QUIET=OFF -GNinja
}

build() {
  ninja -C build install
}

package() {
  install -Dm644 $pkgname/docs/* -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 $pkgname/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 build/ViewerInstall/Data/* -t "$pkgdir/usr/share/$pkgname/Data"
  install -Dm755 build/ViewerInstall/$pkgname -t "$pkgdir/usr/bin"
  cd $pkgname/Linux/deb_template/usr
  rm -dr share/$pkgname
  mv share/* "$pkgdir/usr/share"
}
