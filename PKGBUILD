# Maintainer: Your Name <dennnn8888@gmail.com>
pkgname=aniparser
pkgver=0.3.0
pkgrel=1
pkgdesc="AniParser Electron application"
arch=('x86_64')
url="https://github.com/Sinedka/aniparser"
license=('MIT')
depends=('electron' 'nodejs')
makedepends=('npm' 'git')
source=("https://github.com/Sinedka/aniparser/releases/download/v$pkgver/dist-electron.tar.gz")
sha256sums=('SKIP')

build() {
  return 0
}

package() {
  # Создаём нужные каталоги
  install -d "$pkgdir"/usr/lib/$pkgname
  install -d "$pkgdir"/usr/bin
  install -d "$pkgdir"/usr/share/applications
  install -d "$pkgdir"/usr/share/icons/hicolor/512x512/apps

  # Распаковываем архив
  tar -xzf "$srcdir/dist-electron.tar.gz" -C "$pkgdir"/usr/lib/$pkgname

  # Копируем иконку
  if [ -f "$pkgdir"/usr/lib/$pkgname/dist-react/icon.png ]; then
    install -Dm644 "$pkgdir"/usr/lib/$pkgname/dist-react/icon.png "$pkgdir"/usr/share/icons/hicolor/512x512/apps/$pkgname.png
  fi

  # Создаём desktop entry
  cat > "$pkgdir"/usr/share/applications/$pkgname.desktop <<EOF
[Desktop Entry]
Name=AniParser
Comment=AniParser Electron application
Exec=$pkgname
Icon=$pkgname
Terminal=false
Type=Application
Categories=Utility;
EOF

  # Скрипт запуска
  cat > "$pkgdir"/usr/bin/$pkgname <<EOF
#!/bin/sh
exec electron "$pkgdir"/usr/lib/$pkgname/dist-electron/main.js "\$@"
EOF
  chmod +x "$pkgdir"/usr/bin/$pkgname
}
