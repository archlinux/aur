# Maintainer: nero4kan <vegomdoster@gmail.com>
pkgname=white-music-bin
pkgver=1.0.0
pkgrel=3
pkgdesc="Yandex Music mod (White Music) with bottom search and clean UI"
arch=('x86_64')
url="https://github.com/nerolocker/whitemusic"
license=('MIT')
depends=('nss' 'alsa-lib' 'gtk3' 'libxss' 'libnm')
provides=('white-music')
conflicts=('white-music')

source=("https://github.com/nerolocker/whitemusic/releases/download/Release/white-music.tar.gz")
sha256sums=('SKIP')

package() {
    # 1. Создаем структуру папок
    install -dm755 "$pkgdir/opt/$pkgname"
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/applications"

    # 2. Копируем файлы из вложенной папки white-music (которая в архиве)
    cp -r "$srcdir/white-music/." "$pkgdir/opt/$pkgname/"

    # 3. Создаем симлинк для запуска из терминала
    ln -s "/opt/$pkgname/whitemusic" "$pkgdir/usr/bin/white-music"

    # 4. ГЕНЕРИРУЕМ ЯРЛЫК (Desktop Entry) прямо здесь
    cat <<EOF > "$pkgdir/usr/share/applications/white-music.desktop"
[Desktop Entry]
Name=White Music
Comment=Yandex Music mod with clean UI
Exec=white-music %U
Terminal=false
Type=Application
Icon=/opt/$pkgname/resources/assets/icons/icon_48x48.png
Categories=AudioVideo;Audio;Player;
EOF

    # Устанавливаем права на ярлык
    chmod 644 "$pkgdir/usr/share/applications/white-music.desktop"
}
