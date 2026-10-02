# Maintainer: Frederik Leonhardt <frederik at leonhardt dot co dot nz>
pkgname=lsetwatch
pkgver=1.30
pkgrel=1
pkgdesc="LEGO collection management software"
arch=('x86_64')
url="https://lebostein.de/lsetwatch/index.html"
license=('custom')
depends=('wine')
makedepends=('icoutils')
source=("$pkgname-$pkgver.zip::https://lebostein.de/lsetwatch/builds/Lsetwatch_${pkgver}_Windows_x64.zip"
        "$pkgname.sh"
        "$pkgname.desktop"
)
sha256sums=('636277989165f4db557b54b62fb9c0b95b41b249e1e0879259d942a56d88b4c1'
            'dd8ab5252c38b28cb8c8f75cc6a053c049d0c0604ddab9fb740c3cd2739c91bc'
            '930b1b12b6039c309aa3e3258f0b62ae8e496c67d5f7e054cce8a5d798c07131')

prepare() {
  # Extract icon from EXE
  cd "$srcdir"
  wrestool -x --output=icon.ico -t14 Lsetwatch/Lsetwatch.exe
  icotool -x icon.ico
}

package() {
  install -Dd "$pkgdir/usr/share/$pkgname"
  cp -r "$srcdir/Lsetwatch"/* "$pkgdir/usr/share/$pkgname"

  install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$srcdir/icon_5_256x256x32.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
}

