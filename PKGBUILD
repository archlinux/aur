# Maintainer: Hilton Medeiros <medeiros.hilton@gmail.com>
_pkgname=TrenchBroom
pkgname=trenchbroom-bin
pkgver=2021.1
pkgrel=1
pkgdesc="A free (GPLv3+), cross platform level editor for Quake-engine based games"
arch=("x86_64")
url="https://trenchbroom.github.io/"
license=('GPL3')
provides=('trenchbroom')
conflicts=('trenchbroom' 'trenchbroom-git')
depends=('freeimage' 'qt5-svg' 'freetype2' 'hicolor-icon-theme')
source=("https://github.com/TrenchBroom/TrenchBroom/releases/download/v$pkgver/$_pkgname-Linux-v$pkgver-Release.$CARCH.deb")
noextract=("$_pkgname-Linux-v$pkgver-Release.$CARCH.deb")
sha256sums=('438958f73a85e566c39de268a44684b2a3b8553862dfdc81eede48625995b4f9')

prepare() {
  mkdir -p "$pkgname-$pkgver"
  mkdir -p "$pkgname-$pkgver-files"
  bsdtar xvf "$srcdir/$_pkgname-Linux-v$pkgver-Release.$CARCH.deb" -C "$pkgname-$pkgver"
  bsdtar xvf "$pkgname-$pkgver/data.tar.gz" -C "$pkgname-$pkgver-files"
}

package() {
  cd "$srcdir/$pkgname-$pkgver-files"
  install -Dm644 "usr/share/$_pkgname/trenchbroom.desktop" "$pkgdir/usr/share/applications/trenchbroom.desktop"
  install -Dm644 "usr/share/$_pkgname/icons/icon_512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/trenchbroom.png"
  cp -rf "." "$pkgdir"
  rm -f "$pkgdir/usr/share/$_pkgname/trenchbroom.desktop"
}
