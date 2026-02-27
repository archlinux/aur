pkgname=weeklybrowse
pkgver=1.4
pkgrel=2
pkgdesc="A custom browser with an integrated news portal and bookmarks"
arch=('x86_64')
license=('MIT')
depends=('java-runtime>=11' 'swt' 'firefox' 'gtk3' 'gnome-themes-extra')
makedepends=('java-environment>=11')
source=("WeeklyBrowse.java" "newtab.html" "WeeklyBrowse.desktop" "icon.png")
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

build() {
  cd "$srcdir"
  javac -cp /usr/share/java/swt.jar:. -d . WeeklyBrowse.java
  echo -e "\e[1;31m-------------------------------------------------------\e[0m"
  echo -e "\e[1;31m  Keyboard shortcuts: CTRL D, W, T                     \e[0m"
  echo -e "\e[1;31m-------------------------------------------------------\e[0m"
}

package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/share/java/$pkgname"
  install -m644 *.class "$pkgdir/usr/share/java/$pkgname/"
  install -m644 newtab.html "$pkgdir/usr/share/java/$pkgname/"
  install -Dm644 icon.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
  install -Dm644 WeeklyBrowse.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -d "$pkgdir/usr/bin"
  echo -e "#!/bin/sh\ncd /usr/share/java/$pkgname\nexec java -cp /usr/share/java/swt.jar:. WeeklyBrowse" > "$pkgdir/usr/bin/$pkgname"
  chmod +x "$pkgdir/usr/bin/$pkgname"
}
