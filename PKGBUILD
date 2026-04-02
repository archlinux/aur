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
        "icon.png")
sha256sums=('7877b1de8972b86c7cc602c90be0f182da9078c44b6c398df880e017f1cdc36c'
            'fb24f5b604277a89642122bf4d7931bcd90e4b4e9d0183995d3e9e27fd860382')

package() {
    cd "$srcdir"
    
    # Создаём директорию установки
    install -d "$pkgdir/opt/$pkgname"
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/share/applications"
    install -d "$pkgdir/usr/share/icons/hicolor/512x512/apps"
    
    # Установка иконки
    install -Dm644 "icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
    
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
Icon=$pkgname
Type=Application
Categories=Network;WebBrowser;
StartupNotify=true
EOF
}
