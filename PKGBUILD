# Maintainer:  [none]
# Contributor: dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Basso Daniele <daniele05 dot bass at gmail dot com>
pkgname=xiasl
pkgver=1.1.67
pkgrel=1
pkgdesc="Cross-platform DSDT&SSDT IDE"
arch=(x86_64)
url="https://github.com/ic005k/$pkgname"
license=('')
depends=(qt5-base acpica python-qscintilla-qt5)
makedepends=(glew glfw libxcb)
provides=()
conflicts=()
source=("xiasl-${pkgver}.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz" "$pkgname.desktop")
sha256sums=('7968b3bb06fc949ce04785a28ed2f4f57906fa54eae1c3bd35f5b4c34a8e7fce'
            'b22c9061b8e51333318374202eba41f0fe1d65267b6fa200c185d298b9e042cd')

build() {
  cd "$srcdir/Xiasl-$pkgver"
  qmake
  make -j`nproc`
}

package() {
  cd "$srcdir/Xiasl-$pkgver"
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$srcdir/Xiasl-$pkgver/icon.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
  install -Dm755 "$srcdir/Xiasl-$pkgver/bin/release/Xiasl" $pkgdir/usr/bin/$pkgname
}
