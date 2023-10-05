# Maintainer: dakataca <🐬danieldakataca@gmail.com>
pkgname=android-tethering
pkgver=20230919
url="https://gitlab.com/dakataca/$pkgname.git"
source=("git+$url")
pkgrel=1
pkgdesc="systemd-networkd plugin to share Internet connection from your Android phone to your computer via USB cable"
arch=('x86_64')
license=('MIT')
makedepends=('git')
depends=('usb_modeswitch' 'net-tools')
sha256sums=('SKIP')  # 'makepkg -g' to generate it.

# Función de construcción del paquete
pkgver() {
    cd "$srcdir/$pkgname"
    git log -1 --format="%cd" --date=short | tr -d -
}

# Función de compilación e instalación
package() {
    cd "$srcdir/$pkgname"
    # Instala el script.
    install -Dm755 android-tethering "$pkgdir/usr/bin/android-tethering"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    # Instalar módulos.
    cp -r android-tethering-modules/ "$pkgdir/usr/bin/"
}

# Test:
# rm -rf *.{zst,gz} pkg/ src/ android-tethering/
