# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=svgcleaner-bin
pkgver=0.9.5
pkgrel=3
pkgdesc="SVG Cleaner CLI and the main GUI."
arch=("x86_64")
url="https://github.com/RazrFalcon/svgcleaner-gui"
license=('GPL')
provides=("svgcleaner" "svgcleaner-gui")
conflicts=("svgcleaner" "svgcleaner-git" "svgcleaner-gui" "svgcleaner-gui-git")
depends=("qt5-base" "qt5-svg" "p7zip")
source=("$pkgname-$pkgver::https://github.com/RazrFalcon/svgcleaner-gui/releases/download/v"$pkgver"/svgcleaner_linux_x86_64_"$pkgver".tar.gz" "svgcleaner-gui.desktop" "icons.tar.xz")
md5sums=("b4169480f328c55a1a3b67eb30abe2b6" "8c3fa705bb99742640668a5f8ce523ca" "ced0736123ada1f0b9cd3fc25305dd5f")

package() {
  mkdir -p "$pkgdir/opt/svgcleaner"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/icons/hicolor"
  mkdir -p "$pkgdir/usr/share/applications"

  cp "$srcdir/zopfli" "$pkgdir/opt/svgcleaner/zopfli"
  cp "$srcdir/svgcleaner" "$pkgdir/opt/svgcleaner/svgcleaner"
  cp "$srcdir/svgcleaner-gui" "$pkgdir/opt/svgcleaner/svgcleaner-gui"

  cp "$srcdir/svgcleaner-gui.desktop" "$pkgdir/usr/share/applications/svgcleaner-gui.desktop"
  cp -a "$srcdir/icons/." "$pkgdir/usr/share/icons/hicolor"
  cp -a "$srcdir/icons/." "$pkgdir/usr/share/icons/gnome"

  chmod +x "$pkgdir/opt/svgcleaner/zopfli"
  chmod +x "$pkgdir/opt/svgcleaner/svgcleaner"
  chmod +x "$pkgdir/opt/svgcleaner/svgcleaner-gui"

  ln -s "/usr/bin/7za" "$pkgdir/opt/svgcleaner/7za"

  ln -s "/opt/svgcleaner/svgcleaner" "$pkgdir/usr/bin/svgcleaner"
  ln -s "/opt/svgcleaner/svgcleaner-gui" "$pkgdir/usr/bin/svgcleaner-gui"
}
