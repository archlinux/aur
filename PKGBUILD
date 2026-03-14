# Maintainer: Dominicentek <dominicentekgaming@gmail.com>
pkgname=kirastudio-bin
pkgver=1.0.6
zipver=$(echo $pkgver | sed 's/\.//g')
pkgrel=1
pkgdesc="KiraStudio is a lightweight, cross-platform music studio built around clarity and automation."
url='https://kirastudio.org/'
arch=('x86_64')
depends=('wine' 'rsync')
makedepends=('unzip')
source=("https://github.com/BleuBleu/KiraStudioPublic/releases/download/$pkgver/KiraStudio${zipver}-WinPortableExe.zip" 'kirastudio.desktop' 'kirastudio.png' 'kirastudio-launcher')
sha256sums=(
  'SKIP'
  '0a26c8055ab9c5d9e05cb3f9616a42329a533a91e1ae4204d1f2bb6b0d7400fd'
  'f735588984caeed04c40834de667ee156492cc355f764195415569c9344ce7ed'
  'f1f8166400ed4dceea0a8b702c20b14eb28d90fc47b36343d0ce8e295464328f'
)

package() {
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share/icons"
    mkdir -p "$pkgdir/usr/share/applications"
    cp -r "$srcdir/" "$pkgdir/usr/share/kirastudio"
    cp "$srcdir/kirastudio-launcher" "$pkgdir/usr/bin/kirastudio"
    cp "$srcdir/kirastudio.desktop" "$pkgdir/usr/share/applications/kirastudio.desktop"
    cp "$srcdir/kirastudio.png" "$pkgdir/usr/share/icons/kirastudio.png"
    echo $pkgver > "$pkgdir/usr/share/kirastudio/ks-version.txt"
    unlink "$pkgdir/usr/share/kirastudio/kirastudio-launcher"
    unlink "$pkgdir/usr/share/kirastudio/kirastudio.desktop"
    unlink "$pkgdir/usr/share/kirastudio/kirastudio.png"
    unlink "$pkgdir/usr/share/kirastudio/KiraStudio${zipver}-WinPortableExe.zip"
    chmod +x "$pkgdir/usr/bin/kirastudio"
}
