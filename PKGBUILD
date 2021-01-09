pkgname=gamerworld-bin
_pkgname=GamerWorld-bin
pkgver=1.2.0
pkgrel=5
_pkgrel_x86_64=1
_pkgrel_armv7h=1
_pkgrel_aarch64=1
pkgdesc="Play games all in one place"
arch=('x86_64' 'arm7h' 'aarch64')
url="https://gitlab.com/gamerworld/application"
license=('GPL')
depends=('nss' 'gtk3' 'libxss')
makedepends=('unzip')
conflicts=("gamerworld-git")
sha256sums_x86_64=('SKIP')
sha256sums_armv7h=('SKIP')
sha256sums_aarch64=('SKIP')
source_x86_64=("https://gitlab.com/gamerworld/gw-binaries/-/raw/master/GamerWorld-linux-x64.tar.gz")
source_armv7h=("https://gitlab.com/gamerworld/gw-binaries/-/raw/master/GamerWorld-linux-armv7l.tar.gz")
source_aarch64=("https://gitlab.com/gamerworld/gw-binaries/-/raw/master/GamerWorld-linux-arm64.tar.gz")


package() {
    for dir in GamerWorld-linux-*/ ; do mv "${dir}" "$_pkgname" ;done
    cd $_pkgname
    install -dm755 "$pkgdir/opt/GamerWorld"
    cp -r ./ "$pkgdir/opt/GamerWorld"


    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/GamerWorld" "$pkgdir/usr/bin/GamerWorld"

    # Desktop Entry
    install -Dm644 "$srcdir/$_pkgname/resources/app/GamerWorld.desktop" \
        "$pkgdir/usr/share/applications/$_pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
