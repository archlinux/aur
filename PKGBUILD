pkgname=archisteamfarm-asf-bin
pkgver=6.3.7.0
pkgrel=1
pkgdesc="C# application with primary purpose of farming Steam cards from multiple accounts simultaneously."
arch=('x86_64' 'aarch64')
url="https://github.com/JustArchiNET/ArchiSteamFarm"
license=('Apache')
depends=()
provides=('archisteamfarm')
conflicts=('archisteamfarm-bin')

source_x86_64=("ASF-x64-${pkgver}.zip::https://github.com/JustArchiNET/ArchiSteamFarm/releases/download/${pkgver}/ASF-linux-x64.zip")
source_aarch64=("ASF-arm64-${pkgver}.zip::https://github.com/JustArchiNET/ArchiSteamFarm/releases/download/${pkgver}/ASF-linux-arm64.zip")
sha256sums_x86_64=('4e79f6d0854a37b99404f5d0a477089cacfb40f74317dd1d6615c5c445ce2392')
sha256sums_aarch64=('e568deba489de5f5c1ad8c651a9432022f4901d279ae6048fe3ad2d590251ce3')
noextract=("ASF-x64-${pkgver}.zip" "ASF-arm64-${pkgver}.zip")
options=("!strip" "!debug")

package() {
    install -dm755 "$pkgdir/opt/asf"
    if [ "$CARCH" = "x86_64" ]; then
        unzip -o "${srcdir}/ASF-x64-${pkgver}.zip" -d "$pkgdir/opt/asf"
    elif [ "$CARCH" = "aarch64" ]; then
        unzip -o "${srcdir}/ASF-arm64-${pkgver}.zip" -d "$pkgdir/opt/asf"
    fi
    chmod +x "$pkgdir/opt/asf/ArchiSteamFarm"
    install -dm755 "$pkgdir/usr/bin"
    ln -s /opt/asf/ArchiSteamFarm "$pkgdir/usr/bin/asf"
}
