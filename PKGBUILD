# Maintainer: Hilton Medeiros <medeiros.hilton@gmail.com>
_pkgname=TrenchBroom
pkgname=trenchbroom-bin
pkgver=2022.2
_pkgver=Linux-ubuntu-22.04-v$pkgver-RC3-Release
pkgrel=1
pkgdesc="A free (GPLv3+), cross platform level editor for Quake-engine based games"
arch=("x86_64")
url="https://trenchbroom.github.io/"
license=('GPL3')
provides=('trenchbroom')
conflicts=('trenchbroom' 'trenchbroom-git')
depends=('freeimage' 'glew' 'tinyxml2' 'qt5-svg' 'hicolor-icon-theme')
source=("https://github.com/TrenchBroom/TrenchBroom/releases/download/v$pkgver/$_pkgname-$_pkgver.$CARCH.deb")
noextract=("$_pkgname-$_pkgver.$CARCH.deb")
sha256sums=('69e9863869bd3ba0325fec822b47367f777a8ee14c58eec3fb1334e9a9f60157')

prepare() {
  mkdir -p "$pkgname-$pkgver"
  mkdir -p "$pkgname-$pkgver-files"
  bsdtar xvf "$srcdir/$_pkgname-$_pkgver.$CARCH.deb" -C "$pkgname-$pkgver"
  bsdtar xvf "$pkgname-$pkgver/data.tar.gz" -C "$pkgname-$pkgver-files"
}

package() {
  cd "$srcdir/$pkgname-$pkgver-files"
  install -Dm644 "usr/share/$_pkgname/trenchbroom.desktop" "$pkgdir/usr/share/applications/trenchbroom.desktop"
  install -Dm644 "usr/share/$_pkgname/icons/icon_512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/trenchbroom.png"
  cp -rf "." "$pkgdir"
  rm -f "$pkgdir/usr/share/$_pkgname/trenchbroom.desktop"
}
