# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: drieck <https://aur.archlinux.org/account/dreieck>
# Contributor: frousties <tacentview-git>

pkgname=tacentview
pkgver=1.0.46
_commit=b58407b7b982a85efbe23e1a1535ea058e008e14
pkgrel=1
pkgdesc="Image viewer/editor for tga, png, apng, exr, dds, pvr, ktx, ktx2, astc, pkm, qoi, gif, hdr, jpg, tif, ico, webp, and bmp files"
url="https://github.com/bluescan/tacentview"
license=('ISC')
arch=('x86_64')
depends=('hicolor-icon-theme' 'libx11' 'libxcb')
makedepends=('clang' 'cmake' 'git' 'ninja')
source=("git+$url.git#commit=$_commit")
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
  rm -dr $pkgname/Linux/deb_template/usr/share/$pkgname "$pkgdir/usr/share/$pkgname/Data/TacentView.ico"
  mv $pkgname/Linux/deb_template/usr/share/* "$pkgdir/usr/share"
}
