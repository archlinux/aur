# Maintainer: nero4kan <vegomdoster@gmail.com>
pkgname=white-music-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Yandex Music mod (White Music) with bottom search and clean UI"
arch=('x86_64')
url="https://github.com/nerolocker/whitemusic"
license=('MIT')
depends=('nss' 'alsa-lib' 'gtk3' 'libxss' 'libnm')
provides=('white-music')
conflicts=('white-music')

# Только один файл — одна контрольная сумма
source=("https://github.com/nerolocker/whitemusic/releases/download/Release/white-music.tar.gz")
sha256sums=('SKIP')

package() {
    # Создаем нужные папки в системе
    install -dm755 "$pkgdir/opt/$pkgname"
    install -dm755 "$pkgdir/usr/bin"

    # Копируем содержимое распакованного архива в /opt/white-music-bin
    # Используем "." чтобы скопировать всё содержимое рабочей папки
    cp -r "$srcdir/." "$pkgdir/opt/$pkgname/"

    # Создаем симлинк, чтобы запускать командой 'white-music' в терминале
    # Проверь, что бинарник в архиве называется именно 'whitemusic'
    ln -s "/opt/$pkgname/whitemusic" "$pkgdir/usr/bin/white-music"

    # Если ты решишь добавить иконку позже, просто закинь white-music.desktop в репо
    if [ -f "$srcdir/white-music.desktop" ]; then
        install -dm755 "$pkgdir/usr/share/applications"
        install -m644 "$srcdir/white-music.desktop" "$pkgdir/usr/share/applications/"
    fi
}
