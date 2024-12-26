# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname="apertium-viewer-bin"
_pkgname="${pkgname%-bin}"
pkgver="2.6.0"
pkgrel="1"
pkgdesc="A tool to view and edit the output of the various stages of an apertium translation. (binary)"
url="http://wiki.apertium.org/wiki/Apertium-view"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('java-environment')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
source=("${_pkgname}-$pkgver.jar::https://github.com/apertium/${_pkgname}/releases/download/$pkgver/${_pkgname}.jar"
        "https://raw.githubusercontent.com/apertium/apertium-viewer/refs/heads/master/COPYING")
sha512sums=('a5de6ef6ba897d48fd10290265d19a0cf6beae15826613944f44daae9fa4045ecc7bbf4fd0b44c7dbb1aa7607f99204c63a27f6541ac222b3cea63315396aa2b'
            'cb0a4f39c66d8d6bf668b2e989fc7741b5da50a48cf69921556e87c8d2ab648d23189628e5a26d7b86b9db47c8593e0e4bc6e9881ec03ca8d2ed62d8bd761e84')

_apertium_viewer_desktop="#!/usr/bin/env xdg-open
[Desktop Entry]
Encoding=UTF-8
Version=1.0
Type=Application
Exec=apertium-viewer 
Name=Apertium Viewer
Icon=apertium.png"

build() {
  echo -e "$_apertium_viewer_desktop" | tee apertium-viewer.desktop
  echo "java -Xmx500m -jar /usr/share/apertium/apertium-viewer.jar" > apertium-viewer
}

package() {
  install -Dm644 "COPYING" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm644 $_pkgname.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 apertiumview/resources/apertium.png "${pkgdir}/usr/share/pixmaps/apertium.png"
  install -Dm644 ${_pkgname}-$pkgver.jar "${pkgdir}/usr/share/apertium/apertium-viewer.jar"
  install -Dm755 ${_pkgname} "${pkgdir}/usr/bin/apertium-viewer"
}
