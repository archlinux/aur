pkgname=twitch-bin
_pkgname=Twitch-bin
pkgver=1.0.4
pkgrel=2
_pkgrel_x86_64=1
_pkgrel_armv7h=1
_pkgrel_aarch64=1
pkgdesc="Unofficial Twitch desktop application."
arch=('x86_64' 'arm7h' 'aarch64')
url="https://gitlab.com/twitch/application"
license=('GPL')
depends=('nss' 'gtk3' 'libxss')
makedepends=('unzip')
conflicts=("twitch-git")
sha256sums_x86_64=('74f37d6951a6d08cfaa237cf5ff4c0f74443f76741f317a8455c38ab14403342')
sha256sums_aarch64=('5c6d459a178a360c6aee99038d9e7b1385e156ddaa17dbd09e32b4b7c88e077e')
sha256sums_armv7h=('SKIP')
source_x86_64=("https://gitlab.com/twitch-application/binaries/"$pkgver"-"$pkgrel"/-/raw/main/Twitch-linux-x64.tar.gz")
source_armv7h=("https://gitlab.com/twitch-application/binaries/"$pkgver"-"$pkgrel"/-/raw/main/Twitch-linux-armv7l.tar.gz")
source_aarch64=("https://gitlab.com/twitch-application/binaries/"$pkgver"-"$pkgrel"/-/raw/main/Twitch-linux-arm64.tar.gz")

package() {
    for dir in Twitch-linux-*/ ; do mv "${dir}" "$_pkgname" ;done
    cd $_pkgname
    install -dm755 "$pkgdir/opt/Twitch"
    cp -r ./ "$pkgdir/opt/Twitch"


    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/Twitch" "$pkgdir/usr/bin/Twitch"

    # Desktop Entry
    install -Dm644 "$srcdir/$_pkgname/resources/app/Twitch.desktop" \
        "$pkgdir/usr/share/applications/$_pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
