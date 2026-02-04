# Maintainer: Alfie Rayner <aa.rayner@outlook.com>
pkgname=opentaikohub-bin
_pkgname=OpenTaiko-Hub
pkgver=0.1.6
pkgrel=2
pkgdesc="Description of your app"
arch=('x86_64')
url="https://github.com/OpenTaiko/OpenTaiko-Hub"
license=('mit')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/OpenTaiko/OpenTaiko-Hub/releases/download/v$pkgver/OpenTaiko.Hub_"$pkgver"_amd64.deb")
sha256sums_x86_64=('7fad267f8e1b8e75effe15fa60b7575d5613a6cfa7973441abcf156fde59b277')
package() {
    tar -xz -f data.tar.gz -C "${pkgdir}"

    # Ищем десктоп-файл
    local desktop_file=$(find "${pkgdir}" -name "*.desktop")

    # 1. Прописываем наши переменные окружения
    sed -i 's|Exec=OpenTaiko-Hub|Exec=env WEBKIT_DISABLE_COMPOSITING_MODE=1 GDK_BACKEND=x11 OpenTaiko-Hub|g' "$desktop_file"

    # 2. Добавляем рабочую директорию, чтобы он видел настройки
    # Вставляем строку Path после Exec
    sed -i '/^Exec=/a Path=/usr/lib/OpenTaiko Hub/' "$desktop_file"
}
