pkgname=googleduo-bin
_pkgname=GoogleDuo-bin
pkgver=1.0.1
pkgrel=1
_pkgrel_x86_64=1
_pkgrel_armv7h=1
_pkgrel_aarch64=1
pkgdesc="Unnofficial Google Duo desktop app"
arch=('x86_64' 'arm7h' 'aarch64')
url="https://gitlab.com/google-duo/application"
license=('GPL')
depends=('nss' 'gtk3' 'libxss')
makedepends=('unzip')
conflicts=("googleduo-git")
sha256sums_x86_64=('SKIP')
sha256sums_armv7h=('SKIP')
sha256sums_aarch64=('SKIP')
source_x86_64=("https://gitlab.com/google-duo/binaries/-/raw/master/GoogleDuo-linux-x64.tar.gz")
source_armv7h=("https://gitlab.com/google-duo/binaries/-/raw/master/GoogleDuo-linux-armv7l.tar.gz")
source_aarch64=("https://gitlab.com/google-duo/binaries/-/raw/master/GoogleDuo-linux-arm64.tar.gz")


package() {
    for dir in GoogleDuo-linux-*/ ; do mv "${dir}" "$_pkgname" ;done
    cd $_pkgname
    install -dm755 "$pkgdir/opt/GoogleDuo"
    cp -r ./ "$pkgdir/opt/GoogleDuo"


    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/GoogleDuo" "$pkgdir/usr/bin/GoogleDuo"

    # Desktop Entry
    install -Dm644 "$srcdir/$_pkgname/resources/app/GoogleDuo.desktop" \
        "$pkgdir/usr/share/applications/$_pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
