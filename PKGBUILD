pkgname=subrenamer
pkgver=2.4.0
pkgrel=1
pkgdesc="Batch rename subtitle files to match video names with one-click"
arch=('x86_64')
url="https://github.com/qwqcode/SubRenamer"
license=('GPL-2.0')
groups=()
depends=()
makedepends=('dotnet-sdk')
optdepends=()
source=("https://github.com/qwqcode/SubRenamer/archive/refs/tags/v$pkgver.zip"
        "subrenamer.desktop")
sha256sums=('0314fa482273be46fd68be7c2d83b38c7af7c8e3313447b594855c94e1d20aa3'
            'b4e1f10e2ec8d419452e0da991df874741d0f85c4518cb855389937f326e1f4b')

_repopkgname="SubRenamer"
build() {
        cd "$srcdir/$_repopkgname-$pkgver"
        dotnet publish -c Release
}
package() {
        cd "$srcdir/$_repopkgname-$pkgver"
        install -Dm755 "SubRenamer/bin/Release/net8.0/linux-x64/publish/SubRenamer" -t "$pkgdir/opt/$pkgname"
        install -Dm755 "SubRenamer/bin/Release/net8.0/linux-x64/publish/libSkiaSharp.so" -t "$pkgdir/opt/$pkgname"
        install -Dm755 "SubRenamer/bin/Release/net8.0/linux-x64/publish/libHarfBuzzSharp.so" -t "$pkgdir/opt/$pkgname"

        mkdir -p "$pkgdir/usr/bin"
        ln -s "/opt/$pkgname/SubRenamer" "$pkgdir/usr/bin/subrenamer"

        install -Dm644 "SubRenamer/Assets/icon.png" -T "$pkgdir/usr/share/pixmaps/$pkgname.png"

        install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}
