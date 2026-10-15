# Maintainer: xxyangyoulin <xxyangyoulin@outlook.com>

pkgname=phpbox-bin
pkgver=1.0.18
pkgrel=1
pkgdesc='GUI application to manage PHP Docker development environments (PyQt6, Fluent Design)'
arch=('x86_64')
url='https://github.com/xxyangyoulin/phpbox'
license=('MIT')
options=('!strip')
provides=('phpbox')
conflicts=('phpbox')
depends=('docker' 'hicolor-icon-theme')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/phpbox-linux-x86_64.tar.gz"
        "phpbox.desktop::$url/raw/v$pkgver/phpbox.desktop"
        "LICENSE::$url/raw/v$pkgver/LICENSE")
noextract=("LICENSE")
sha256sums=('e38688d6bfbc66ced0d18b6af1ad0d68875773f0968d21cab19363b9ff9d532b'
            '4c8a4eff64d7b49dfd235f93a1b0610919528d1b3b541c60d6f0a2975b48b98d'
            '87c8ce3041afa2de6c78c8a3158050e656ef1f4d436406c22847c8aab191946b')

package() {
    cd "$srcdir/phpbox"

    # PyInstaller onedir bundle -> /opt/phpbox
    install -dm755 "$pkgdir/opt/phpbox"
    cp -a . "$pkgdir/opt/phpbox/"

    # launcher + pbox alias
    install -dm755 "$pkgdir/usr/bin"
    ln -s /opt/phpbox/phpbox "$pkgdir/usr/bin/phpbox"
    ln -s /opt/phpbox/phpbox "$pkgdir/usr/bin/pbox"

    # desktop entry + icons
    install -Dm644 "$srcdir/phpbox.desktop" "$pkgdir/usr/share/applications/phpbox.desktop"
    install -Dm644 _internal/resources/icons/phpbox-256.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/phpbox.png"
    install -Dm644 _internal/resources/icons/phpbox-tray.png "$pkgdir/usr/share/pixmaps/phpbox-tray.png"

    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
