# Maintainer: Dmytro Meleshko <dmytro.meleshko@gmail.com>
_pkgname=rx
pkgname=${_pkgname}-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="A modern and extensible pixel editor implemented in Rust (this package downloads and extracts the official AppImage)"
arch=("x86_64")
url="https://cloudhead.io/rx/"
license=("GPL3")
depends=("libx11" "gcc-libs")
provides=(${_pkgname})
conflicts=(${_pkgname})
options=(!strip)
_appimage_file="$_pkgname-$pkgver-$CARCH.AppImage"
source=("https://github.com/cloudhead/rx/releases/download/v$pkgver/$_appimage_file")
noextract=("$_appimage_file")
sha256sums=('bfc50922b9dfd4442067a423789aea3190c55e92878ab072f8cce886017974ee')

build() {
  chmod +x "$_appimage_file"
  mkdir -p "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
  ../"$_appimage_file" --appimage-extract
}

package() {
  cd "$pkgname-$pkgver/squashfs-root"
  install -Dm755 "usr/bin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "usr/share/applications/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 "usr/share/icons/hicolor/64x64/apps/$_pkgname.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
}
