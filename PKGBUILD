pkgname=rscrevolution
_pkgname=RSCRevolution
pkgver=1.0.4
pkgrel=1
pkgdesc="The most developed, longest running, most active and the only FREE OldSchool RuneScape Classic Private Server."
arch=('any')
url="https://gitlab.com/linuxbombay/rscrevolution"
license=('N/A')
depends=('java-runtime>=11')
makedepends=('unzip')
source=("$url/-/archive/$pkgver/rscrevolution-$pkgver.tar.bz2")
sha256sums=('ba6c60b037a924afc8f299ef7245f35e70f7d61f3f38d46e43c6f43361a3e975')

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm775 "$pkgdir/usr/share/games/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps"
    
    cd "$srcdir/$pkgname-$pkgver"
    cp -r ./ "$pkgdir/usr/share/games/$_pkgname"
    install -Dm755 "$pkgname.png" "$pkgdir/usr/share/pixmaps"

    # Link to binary
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Desktop Entry
    install -Dm644 "$pkgname.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$pkgname.desktop"
}
