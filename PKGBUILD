# Maintainer: Nikita <nikitamkrotov@gmail.com>
pkgname=slavweb-electron
pkgver=1.0.2
pkgrel=1
pkgdesc="Кроссплатформенное десктопное приложение на Electron для SlavWEB"
arch=('x86_64')
url="https://github.com/gtinikita203/linux-unpacked-slav"
license=('MIT')
depends=('gtk3' 'libnotify' 'libxtst' 'nss' 'xdg-utils' 'libxss' 'dbus' 'at-spi2-atk' 'pipewire' 'wireplumber' 'xdg-desktop-portal' 'xdg-desktop-portal-gtk')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gtinikita203/linux-unpacked-slav/releases/download/$pkgver/slavweb-electron-$pkgver-linux-unpacked.tar.gz"
        "icon.webp")
sha256sums=('7877b1de8972b86c7cc602c90be0f182da9078c44b6c398df880e017f1cdc36c'
            'e403256660758710fd7545d29866336e02b274e3b953d188349ae86d657fde44')

package() {
    cd "$srcdir"
    
    # Создаём директорию установки
    install -d "$pkgdir/opt/$pkgname"
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/share/applications"
    install -d "$pkgdir/usr/share/icons/hicolor/512x512/apps"
    
    # Установка иконки
    install -Dm644 "icon.webp" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.webp"
    
    # Копируем все файлы приложения
    cp -r "linux-unpacked/"* "$pkgdir/opt/$pkgname/"
    
    # Создаём симлинк на исполняемый файл
    ln -s "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
    
    # Создаём .desktop файл
    cat > "$pkgdir/usr/share/applications/$pkgname.desktop" << EOF
[Desktop Entry]
Name=SlavWEB Electron
Comment=Кроссплатформенное десктопное приложение на Electron для SlavWEB
Exec=/opt/$pkgname/$pkgname %U
Icon=$pkgname.webp
Type=Application
Categories=Network;WebBrowser;
StartupNotify=true
EOF
}
