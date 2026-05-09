# Maintainer: Ваше Имя <vash_email@example.com>
pkgname=universal-downloader
pkgver=1.0
pkgrel=1
pkgdesc="Simple and fast video downloader built with Python and PySide6"
arch=('any')
url="https://github.com/HotcatDev/UniversalDownloader" # Укажите реальный URL
license=('MIT')
depends=('python' 'pyside6' 'python-pip' 'yt-dlp' 'ffmpeg') # Основные зависимости из репозиториев
makedepends=('git')
source=("git+$url.git")
sha256sums=('SKIP')

package() {
  cd "$srcdir/UniversalDownloader"

  # 1. Копируем исходники в системную директорию /opt
  install -d "$pkgdir/opt/$pkgname"
  cp -r * "$pkgdir/opt/$pkgname/"

  # 2. Создаем исполняемый файл в /usr/bin для запуска
  install -d "$pkgdir/usr/bin"
  echo -e "#!/bin/sh\ncd /opt/$pkgname && python main.py \"\$@\"" > "$pkgdir/usr/bin/$pkgname"
  chmod +x "$pkgdir/usr/bin/$pkgname"
}
