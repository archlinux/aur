pkgname=youtube-bin
_pkgname=Youtube-bin
pkgver=1.0.6
pkgrel=2
_pkgrel_x86_64=1
_pkgrel_armv7h=1
_pkgrel_aarch64=1
pkgdesc="Unnofficial Youtube desktop application"
arch=('x86_64' 'arm7h' 'aarch64')
url="https://gitlab.com/youtube/application"
license=('GPL')
depends=('nss' 'gtk3' 'libxss')
makedepends=('unzip')
conflicts=("youtube-git")
sha256sums_x86_64=('ab680e5d43a1a53d8f23da27b2cf2a4b5e6eff79082691c7899762a2dde0356f')
sha256sums_aarch64=('3e454664573f2247cb8c7ef5305bb24437a9ba487595da16ca0801e664ba693c')
sha256sums_armv7h=('SKIP')
source_x86_64=("https://gitlab.com/youtube-desktop/binaries/"$pkgver"-"$pkgrel"/-/raw/main/Youtube-linux-x64.tar.gz")
source_armv7h=("https://gitlab.com/youtube-desktop/binaries/"$pkgver"-"$pkgrel"/-/raw/main/Youtube-linux-armv7l.tar.gz")
source_aarch64=("https://gitlab.com/youtube-desktop/binaries/"$pkgver"-"$pkgrel"/-/raw/main/Youtube-linux-arm64.tar.gz")


package() {
    for dir in Youtube-linux-*/ ; do mv "${dir}" "$_pkgname" ;done
    cd $_pkgname
    install -dm755 "$pkgdir/opt/Youtube"
    cp -r ./ "$pkgdir/opt/Youtube"


    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/Youtube" "$pkgdir/usr/bin/Youtube"

    # Desktop Entry
    install -Dm644 "$srcdir/$_pkgname/resources/app/Youtube.desktop" \
        "$pkgdir/usr/share/applications/Youtube.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/Youtube.desktop"
}
