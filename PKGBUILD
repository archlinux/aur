# Maintainer: leoneii comdir@infonix.info

name=chromium-gost
pkgname=chromium-gost
url="https://github.com/deemru/Chromium-Gost"
pkgver=156.0.8078.88
pkgrel=1
pkgdesc="Chromium-Gost — веб-браузер с открытым исходным кодом на основе Chromium с поддержкой криптографических алгоритмов ГОСТ при установке защищённых соединений через интерфейс msspi"
arch=('x86_64')
license=('MIT')
source=("https://github.com/deemru/Chromium-Gost/releases/download/${pkgver}/chromium-gost-${pkgver}-linux-amd64.deb")
sha256sums=('2c70c5fb46c1a36ac671d39cbe8d14cfe57ee1f702ce6ac7065919263845db9f')

makedepends=(
)
depends=(
)

build() {
  echo "Skiping build....."
  # Извлекаем содержимое RPM
 # rpm2cpio "$srcdir/chromium-gost-${pkgver}-linux-amd64.rpm" | cpio -id -m -P  # -P - это чтобы не удаляло символические ссылки
  # Дополнительные шаги по сборке, если необходимо
  # Например, копируем файлы из извлеченного RPM в каталог сборки
 # mv ./your-package-directory/ /path/to/your/build/directory
  # Запускаем скрипты установки, если необходимо
  # ./configure
  # make
}

package() {
  # Копируем необходимые файлы в каталог пакета
  echo "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"

  # .desktop-файл ссылается на Icon=chromium-gost (поиск по теме иконок),
  # но .deb кладёт логотипы только в /opt/chromium-gost/product_logo_*.png -
  # не по стандартным путям hicolor-темы. Раскладываем их туда вручную,
  # чтобы иконка реально отображалась в меню приложений.
  local size
  for size in 16 24 32 48 64 128 256; do
    local src="${pkgdir}/opt/chromium-gost/product_logo_${size}.png"
    if [ -f "${src}" ]; then
      install -Dm644 "${src}" \
        "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/chromium-gost.png"
    fi
  done
}

