# Maintainer: leoneii comdir@infonix.info

name=chromium-gost
pkgname=chromium-gost
url="https://github.com/deemru/Chromium-Gost"
pkgver=150.0.7871.224
pkgrel=1
pkgdesc="Chromium-Gost — веб-браузер с открытым исходным кодом на основе Chromium с поддержкой криптографических алгоритмов ГОСТ при установке защищённых соединений через интерфейс msspi"
arch=('x86_64')
license=('MIT')
source=("https://github.com/deemru/Chromium-Gost/releases/download/${pkgver}/chromium-gost-${pkgver}-linux-amd64.deb")
sha256sums=('37aa39105e212deab5de98927da25ee7ff467acd48b836ceedb303385db6a862')

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

