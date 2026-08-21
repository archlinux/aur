# Maintainer: l1ngus
pkgname=lucid-spell-bin
_pkgname=lucid-spell
pkgver=0.1.0
pkgrel=1
pkgdesc="LLM-powered desktop translator. (Binary)"
arch=('x86_64')
url="https://github.com/l1ngus/lucid-spell"
license=('MIT') # Убедись, что лицензия совпадает с твоим репозиторием
options=('!debug')

# Оставляем только зависимости для запуска (runtime). Сборочные (rust, npm) убираем.
depends=('webkit2gtk-4.1'
  'libayatana-appindicator'
  'gtk3'
  'glib2'
  'libsoup3'
  'openssl')

provides=("$_pkgname")
conflicts=("$_pkgname")

# Ссылка на скомпилированный .deb пакет из релизов GitHub.
# ВАЖНО: Проверь точное название файла .deb, которое генерирует твой CI/CD, и при необходимости поправь URL.
source=("$url/releases/download/v$pkgver/${_pkgname}_${pkgver}_amd64.deb")

# На этапе настройки оставь SKIP. Мы сгенерируем актуальный хэш автоматически.
sha256sums=('0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5')

package() {
  # При сборке makepkg автоматически скачивает .deb и распаковывает его базовую структуру в папку src/.
  # Внутри будут лежать файлы control.tar.* и data.tar.*.
  # Нам нужно просто распаковать data.tar.* напрямую в $pkgdir.
  # Внутри уже готовая иерархия папок (usr/bin, usr/share).

  tar -xf data.tar.* -C "$pkgdir"

  # Опционально: установка лицензии (если Tauri не кладет ее в deb по умолчанию)
  # install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
