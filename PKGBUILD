# Maintainer: Dongle (GH: dongle-the-gadget)

pkgname=uupdumpbot
_pkgname=UUPdumpbot
pkgver=1.0.2
_pkgver=1.0.2-5.0
pkgdesc="UUP dump bot for Discord"
pkgrel=1
arch=('x86_64')
url='https://github.com/dongle-the-gadget/UUPdumpbot'
license=("MIT")
depends=("icu")
makedepends=("dotnet-sdk")
options=("staticlibs")
source=("$url/archive/v$_pkgver.tar.gz")
sha256sums=('50bf8bbb51c4bf8dd0c959436431cc0231e316e18ff717438fa5f137578d1d59')

build() {
    cd "$_pkgname-$_pkgver/UnofficialUUPDumpBot"
    MSBUILDDISABLENODEREUSE=1 dotnet publish \
        --configuration Release \
        --self-contained true \
        --runtime linux-x64 \
        -p:PublishTrimmed=true \
        --output ../$pkgname \
        ./UnofficialUUPDumpBot.csproj
}

package() {
    cd "$_pkgname-$_pkgver"

    install -d $pkgdir/usr/{bin,lib}
    cp -r $pkgname "$pkgdir/usr/lib"
    ln -s "/usr/lib/$pkgname/UnofficialUUPDumpBot" "$pkgdir/usr/bin/$pkgname"
}
