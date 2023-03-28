# Maintainer: Hilton Medeiros <medeiros.hilton@gmail.com>
_pkgname=TrenchBroom
pkgname=trenchbroom-bin
pkgver=2023.1
_pkgver=Linux-ubuntu-22.04-v$pkgver-Release.$CARCH
pkgrel=1
pkgdesc="A free (GPLv3+), cross platform level editor for Quake-engine based games"
arch=("x86_64")
url="https://trenchbroom.github.io/"
license=('GPL3')
provides=('trenchbroom')
conflicts=('trenchbroom' 'trenchbroom-git')
depends=('freeimage' 'glew' 'tinyxml2' 'qt5-svg' 'hicolor-icon-theme')
source=("https://github.com/TrenchBroom/TrenchBroom/releases/download/v$pkgver/$_pkgname-$_pkgver.deb")
noextract=("$_pkgname-$_pkgver.deb")
sha256sums=('b7e2e8b84109799367e1e044ecd32ff9b002b04c96137bfa358e9a650bdda79e')

prepare() {
  mkdir -p "$pkgname-$pkgver"
  mkdir -p "$pkgname-$pkgver-files"
  bsdtar xvf "$srcdir/$_pkgname-$_pkgver.deb" -C "$pkgname-$pkgver"
  bsdtar xvf "$pkgname-$pkgver/data.tar.gz" -C "$pkgname-$pkgver-files"
}

package() {
  cd "$srcdir/$pkgname-$pkgver-files"
  install -Dm644 "usr/share/$_pkgname/trenchbroom.desktop" "$pkgdir/usr/share/applications/trenchbroom.desktop"
  install -Dm644 "usr/share/$_pkgname/icons/icon_512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/trenchbroom.png"
  cp -rf "." "$pkgdir"
  rm -f "$pkgdir/usr/share/$_pkgname/trenchbroom.desktop"
}
