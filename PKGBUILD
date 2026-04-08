# Maintainer: Lunsly
pkgname=violet-launcher
pkgver=1.0.1
pkgrel=1
pkgdesc="Лаунчер для Violet World с крутой иконкой"
arch=('any')
url="https://github.com/Lunsly/violet-launcher"
license=('GPL')
depends=('python' 'python-pillow' 'python-requests' 'python-customtkinter' 'python-minecraft-launcher-lib')
source=("git+https://github.com/Lunsly/violet-launcher.git")
md5sums=('SKIP')

package() {
  cd "$srcdir/$pkgname"

  # 1. Копируем файлы программы
  install -d "$pkgdir/usr/lib/$pkgname"
  cp -r * "$pkgdir/usr/lib/$pkgname/"

  # 2. Создаем запускаемый файл в /usr/bin
  install -d "$pkgdir/usr/bin"
  echo -e "#!/bin/sh\npython /usr/lib/$pkgname/main.py \"\$@\"" > "$pkgdir/usr/bin/$pkgname"
  chmod +x "$pkgdir/usr/bin/$pkgname"

  # 3. Устанавливаем иконку
  install -Dm644 "icon.png" "$pkgdir/usr/share/pixmaps/violet-launcher.png"

  # 4. Создаем ярлык для меню (Desktop Entry)
  install -d "$pkgdir/usr/share/applications"
  echo "[Desktop Entry]
Type=Application
Name=Violet Launcher
Comment=Launcher for Violet World
Exec=violet-launcher
Icon=violet-launcher
Terminal=false
Categories=Game;" > "$pkgdir/usr/share/applications/violet-launcher.desktop"
}
