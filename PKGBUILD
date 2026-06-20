# Maintainer: Dominicentek <dominicentekgaming@gmail.com>
pkgname=kirastudio-bin
pkgver=1.0.7
zipver=$(echo $pkgver | sed 's/\.//g')
pkgrel=2
pkgdesc="KiraStudio is a lightweight, cross-platform music studio built around clarity and automation."
url='https://kirastudio.org/'
install=kirastudio.install
arch=('x86_64')
depends=('wine' 'rsync')
makedepends=('unzip')
source=("https://github.com/BleuBleu/KiraStudioPublic/releases/download/$pkgver/KiraStudio${zipver}-WinPortableExe.zip"
  'kirastudio.desktop' 'kirastudio.png' 'kirastudio-launcher' 'kirastudio.install' 'kirastudio.xml'
)
sha256sums=(
  'SKIP'
  'e19f63f871bc03a1875cd8cc6fe3130642dccb37a82d2d791192b24e744a8137'
  'f735588984caeed04c40834de667ee156492cc355f764195415569c9344ce7ed'
  '055d6b8b7e84b820e3e61ffdbc01a63b95afcf5e35079d0ad02b92f4feaff8ed'
  'e8948576678d114f3997ea65f9caa25d530e767df46442a210fa555d72dc25fc'
  'a7183e81321c6f5634c808d0cf2d58cd3e05e630a7a9af64f4447385d988a21a'
)

package() {
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share/icons/hicolor/128x128/apps"
    mkdir -p "$pkgdir/usr/share/icons/hicolor/128x128/mimetypes"
    mkdir -p "$pkgdir/usr/share/applications"
    mkdir -p "$pkgdir/usr/share/mime/packages"
    cp -r "$srcdir/" "$pkgdir/usr/share/kirastudio"
    cp "$srcdir/kirastudio-launcher" "$pkgdir/usr/bin/kirastudio"
    cp "$srcdir/kirastudio.desktop" "$pkgdir/usr/share/applications/kirastudio.desktop"
    cp "$srcdir/kirastudio.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/kirastudio.png"
    cp "$srcdir/kirastudio.png" "$pkgdir/usr/share/icons/hicolor/128x128/mimetypes/application-x-kirastudio-project.png"
    cp "$srcdir/kirastudio.xml" "$pkgdir/usr/share/mime/packages/kirastudio.xml"
    echo $pkgver > "$pkgdir/usr/share/kirastudio/ks-version.txt"
    unlink "$pkgdir/usr/share/kirastudio/kirastudio-launcher"
    unlink "$pkgdir/usr/share/kirastudio/kirastudio.desktop"
    unlink "$pkgdir/usr/share/kirastudio/kirastudio.png"
    unlink "$pkgdir/usr/share/kirastudio/KiraStudio${zipver}-WinPortableExe.zip"
    chmod +x "$pkgdir/usr/bin/kirastudio"
}
