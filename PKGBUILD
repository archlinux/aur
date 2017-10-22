# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>

pkgname=cryspmds
pkgver=1
pkgrel=1
pkgdesc='CrySP Multidevice Study'
arch=('any')
url='https://cryspmds.erinn.io/'
depends=('java-runtime')
optdepends=(
    'gnome-shell-extension-topicons-plus: restore system tray on GNOME (application requires a system tray to run)'
)
source=('https://cryspmds.erinn.io/dl/cryspmds.deb')
sha256sums=('e49985b80ee05d026bdd7afaeead2c86ebb673b2ca00fb4bd7a1843dbcd4f788')

prepare() {
    mkdir -p control data
    tar xf control.tar.gz -C control
    tar xf data.tar.xz -C data
}

build() {
    sed -i "
/^Icon=/ s|usr/local/bin/logo48.png|usr/share/icons/$pkgname.png|
/^Exec=/ s|usr/local/bin/run|usr/bin/java -jar /usr/share/java/$pkgname/$pkgname.jar|
" "data/usr/local/bin/$pkgname.desktop"
}

package() {
    install -Dm644 "data/usr/local/bin/$pkgname.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
    install -Dm644 "data/usr/local/bin/logo48.png" "$pkgdir/usr/share/icons/$pkgname.png"
    install -Dm644 "data/usr/local/bin/$pkgname.desktop" "$pkgdir/etc/xdg/autostart/$pkgname.desktop"
}
