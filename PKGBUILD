# Maintainer: Hilton Medeiros <medeiros.hilton@gmail.com>
_pkgname=TrenchBroom
pkgname=trenchbroom-bin
pkgver=2022.1
pkgrel=1
pkgdesc="A free (GPLv3+), cross platform level editor for Quake-engine based games"
arch=("x86_64")
url="https://trenchbroom.github.io/"
license=('GPL3')
provides=('trenchbroom')
conflicts=('trenchbroom' 'trenchbroom-git')
depends=('qt5-svg' 'hicolor-icon-theme')
source=("https://github.com/TrenchBroom/TrenchBroom/releases/download/v$pkgver/$_pkgname-Linux-v$pkgver-Release.$CARCH.deb")
noextract=("$_pkgname-Linux-v$pkgver-Release.$CARCH.deb")
sha256sums=('d0d1bfc159d1aa99ef727521fab1e476cef38bf6b6d670a7c472222f673496a1')

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
