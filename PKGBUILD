pkgname=dosierskanilo-gui
pkgver=0.6.0
backendver=26.9.2
pkgrel=1
pkgdesc='GTK desktop frontend for DosierSkanilo JSON data'
arch=('x86_64')
url='https://gitlab.vahanus.net/dlang/dosierskanilo-gui'
license=('custom:CC-BY-NC-SA-4.0')
depends=('gtk3' 'gstreamer')
makedepends=('ldc' 'dub' 'git')
source=("$pkgname-$pkgver.tar.gz::https://gitlab.vahanus.net/dlang/dosierskanilo-gui/-/archive/v$pkgver/dosierskanilo-gui-v$pkgver.tar.gz"
        "dosierskanilo-$backendver.tar.gz::https://github.com/cschlote/DosierSkanilo/archive/refs/tags/v$backendver.tar.gz")
sha256sums=('SKIP')

prepare() {
  ln -s "$srcdir/DosierSkanilo-$backendver" "$srcdir/DosierSkanilo"
}

build() {
  cd "$srcdir/dosierskanilo-gui-v$pkgver"
  DC=ldc2 dub build --build=release --compiler=ldc2
}

package() {
  cd "$srcdir/dosierskanilo-gui-v$pkgver"
  install -Dm755 build/bin/dosierskanilo-gui "$pkgdir/usr/bin/dosierskanilo-gui"
}
