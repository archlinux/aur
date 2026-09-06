# Maintainer: Donato Foglia <fogliadonato2@gmail.com>
pkgname=nexus-aur-bin
pkgver=1.0.6
pkgrel=1
pkgdesc="Un gestore di pacchetti grafico per Arch Linux e AUR scritto in Flutter"
arch=('x86_64')
url="https://github.com/IlNinjaDiBattipaglia/Nexus-AUR"
license=('MIT')
depends=('gtk3' 'glib2' 'util-linux' 'yay')
provides=('nexus-aur')
conflicts=('nexus-aur')
source=("$pkgname-$pkgver.tar.gz::https://github.com/IlNinjaDiBattipaglia/Nexus-AUR/releases/download/v$pkgver/nexus-aur-linux-x86_64.tar.gz")
sha256sums=('c9627d6debc60487f046ee321942b6728605f2f07f3b4989bf989b0c7c451a2e')

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/opt/nexus_aur"
    install -dm755 "$pkgdir/usr/share/applications"
    install -dm755 "$pkgdir/usr/share/icons/hicolor/512x512/apps"

    # Copia tutto il bundle Flutter in /opt
    cp -r * "$pkgdir/opt/nexus_aur/"

    # Crea il symlink per l'eseguibile
    ln -s /opt/nexus_aur/nexus_aur "$pkgdir/usr/bin/nexus-aur"

    # Sposta il file .desktop e l'icona nelle cartelle di sistema correnti
    if [ -f "$pkgdir/opt/nexus_aur/share/applications/nexus-aur.desktop" ]; then
        mv "$pkgdir/opt/nexus_aur/share/applications/nexus-aur.desktop" "$pkgdir/usr/share/applications/"
    fi
    if [ -f "$pkgdir/opt/nexus_aur/share/icons/hicolor/512x512/apps/nexus-aur.png" ]; then
        mv "$pkgdir/opt/nexus_aur/share/icons/hicolor/512x512/apps/nexus-aur.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/"
    fi

    # Rimuove la cartella share ridondante da /opt
    rm -rf "$pkgdir/opt/nexus_aur/share"
}
