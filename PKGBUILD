pkgname=fbmessenger-bin
_pkgname=FBMessenger-bin
pkgver=1.0.0
pkgrel=2
_pkgrel_x86_64=1
_pkgrel_armv7h=1
_pkgrel_aarch64=1
pkgdesc="(BETA) Unofficial Facebook messenger desktop application."
arch=('x86_64' 'armv7h' 'aarch64')
url="https://gitlab.com/facebookmessenger/application"
license=('GPL')
depends=('nss' 'gtk3' 'libxss')
makedepends=('unzip')
conflicts=("fbmessenger-git")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')
sha256sums_armv7h=('SKIP')
source_x86_64=("https://gitlab.com/facebookmessenger/binaries/"$pkgver"-"$pkgrel"/-/raw/main/Messenger-linux-x64.tar.gz")
source_armv7h=("https://gitlab.com/facebookmessenger/binaries/"$pkgver"-"$pkgrel"/-/raw/main/Messenger-linux-armv7l.tar.gz")
source_aarch64=("https://gitlab.com/facebookmessenger/binaries/"$pkgver"-"$pkgrel"/-/raw/main/Messenger-linux-arm64.tar.gz")

package() {
    for dir in Messenger-linux-*/ ; do mv "${dir}" "$_pkgname" ;done
    cd $_pkgname
    install -dm755 "$pkgdir/opt/Messenger"
    install -dm755 "$pkgdir/usr/share/pixmaps"    
    cp -r ./ "$pkgdir/opt/Messenger"
    cp -r "$pkgdir/opt/Messenger/resources/app/messenger.svg" "$pkgdir/usr/share/pixmaps"     


    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/Messenger/messenger" "$pkgdir/usr/bin/messenger"

    # Desktop Entry
    install -Dm644 "$srcdir/$_pkgname/resources/app/Messenger.desktop" \
        "$pkgdir/usr/share/applications/Messenger.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/Messenger.desktop"
}
