pkgname=messages-bin
_pkgname=Messages-bin
pkgver=1.0.2
pkgrel=2
_pkgrel_x86_64=1
_pkgrel_armv7h=1
_pkgrel_aarch64=1
pkgdesc="Unnofficial messages desktop app."
arch=('x86_64' 'arm7h' 'aarch64')
url="https://gitlab.com/androidmessages/application"
license=('GPL')
depends=('nss' 'gtk3' 'libxss')
makedepends=('unzip')
conflicts=("messages-git")
sha256sums_x86_64=('SKIP')
sha256sums_armv7h=('SKIP')
sha256sums_aarch64=('SKIP')
source_x86_64=("https://gitlab.com/androidmessages/binaries/"$pkgver"-"$pkgrel"/-/raw/main/Messages-linux-x64.tar.gz")
source_armv7h=("https://gitlab.com/androidmessages/binaries/"$pkgver"-"$pkgrel"/-/raw/main/Messages-linux-armv7l.tar.gz")
source_aarch64=("https://gitlab.com/androidmessages/binaries/"$pkgver"-"$pkgrel"/-/raw/main/Messages-linux-arm64.tar.gz")


package() {
    for dir in Messages-linux-*/ ; do mv "${dir}" "$_pkgname" ;done
    cd $_pkgname
    install -dm755 "$pkgdir/opt/Messages"
    cp -r ./ "$pkgdir/opt/Messages"


    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/Messages" "$pkgdir/usr/bin/Messages"

    # Desktop Entry
    install -Dm644 "$srcdir/$_pkgname/resources/app/Messages.desktop" \
        "$pkgdir/usr/share/applications/Messages.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/Messages.desktop"
}
