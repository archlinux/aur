pkgname=primevideo-bin
_pkgname=PrimeVideo-bin
pkgver=1.0.0
pkgrel=1
_pkgrel_x86_64=1
pkgdesc="Unnofficial Prime Videos desktop application"
arch=('x86_64')
url="https://gitlab.com/primevideos"
license=('GPL')
depends=('nss' 'gtk3' 'libxss')
makedepends=('unzip')
conflicts=("primevideos-git")
sha256sums_x86_64=('SKIP')
source_x86_64=("https://gitlab.com/primevideo/binaries/$pkgver-$pkgrel/-/raw/main/PrimeVideo-linux-x64.tar.xz")

package() {
    for dir in PrimeVideo-linux-*/ ; do mv "${dir}" "$_pkgname" ;done
    cd $_pkgname
    install -dm755 "$pkgdir/opt/PrimeVideo"
    install -dm755 "$pkgdir/usr/share/pixmaps"    
    cp -r ./ "$pkgdir/opt/PrimeVideo"
    cp -r "$pkgdir/opt/PrimeVideo/primevideo.svg" "$pkgdir/usr/share/pixmaps"  


    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/PrimeVideo/primevideo" "$pkgdir/usr/bin/primevideo"

    # Desktop Entry
    install -Dm644 "$srcdir/$_pkgname/PrimeVideo.desktop" \
        "$pkgdir/usr/share/applications/PrimeVideo.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/PrimeVideo.desktop"
}
