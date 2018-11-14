# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=svgcleaner-bin
pkgver=0.9.5
pkgrel=4
pkgdesc="SVG Cleaner CLI and the main GUI"
arch=("x86_64")
url="https://github.com/RazrFalcon/svgcleaner-gui"
license=("GPL")
provides=("svgcleaner" "svgcleaner-gui")
conflicts=("svgcleaner" "svgcleaner-git" "svgcleaner-gui" "svgcleaner-gui-git")
depends=("qt5-base" "qt5-svg" "p7zip")
source=(
  "$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/svgcleaner_linux_${CARCH}_$pkgver.tar.gz"
  "svgcleaner-gui.desktop"
  "icons.tar.xz"
)
md5sums=(
  "b4169480f328c55a1a3b67eb30abe2b6"
  "8c3fa705bb99742640668a5f8ce523ca"
  "ced0736123ada1f0b9cd3fc25305dd5f"
)

package() {
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/icons/hicolor"

  install -Dm755 "$srcdir/zopfli" "$pkgdir/opt/$pkgname/zopfli"
  install -Dm755 "$srcdir/svgcleaner" "$pkgdir/opt/$pkgname/svgcleaner"
  install -Dm755 "$srcdir/svgcleaner-gui" "$pkgdir/opt/$pkgname/svgcleaner-gui"
  install -Dm644 "$srcdir/svgcleaner-gui.desktop" "$pkgdir/usr/share/applications/svgcleaner-gui.desktop"

  cp -a "$srcdir/icons/." "$pkgdir/usr/share/icons/hicolor"
  cp -a "$srcdir/icons/." "$pkgdir/usr/share/icons/gnome"

  ln -s "/usr/bin/7za" "$pkgdir/opt/$pkgname/7za"
  ln -s "/opt/$pkgname/svgcleaner" "$pkgdir/usr/bin/svgcleaner"
  ln -s "/opt/$pkgname/svgcleaner-gui" "$pkgdir/usr/bin/svgcleaner-gui"
}
