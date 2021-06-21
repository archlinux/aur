# Maintainer: Richard Bradfield <bradfier@fstab.me>
# Developer: James Muscat <james@timing71.org>

pkgname=timing71
pkgver=2021.1.2
pkgrel=1
pkgdesc="Desktop client for the Timing71 live timing aggregation service."
arch=('x86_64')
url="https://www.timing71.org"
license=('custom')
depends=('electron9')
# options=(!strip)
source=("$pkgname-v$pkgver.AppImage::https://releases.timing71.org/client/v$pkgver/Timing71%20Client%20v$pkgver.AppImage"
        "wrapper.sh")
sha512sums=('b8427dffdf5c0c4a15a9df05c949545b3c65540c12c8ad2299538b2ccf67bd95a3a1aa4af5e7f63bdda500b9b4411c8aaa4a5ee08bd28ccd6ca95250e99d45c6'
            'cfa60e34c36c03af745c3989bd184f1275cbe962db53dc5aec0ed96c865cbfba98a92b4ebac4f0e17fdc2d0dcb6281d4db23c9ad1fe85514b7e21e3d652685b2')

prepare() {
    chmod +x "$pkgname-v$pkgver".AppImage
    ./"$pkgname-v$pkgver".AppImage --appimage-extract
}

package() {
    mkdir -p "$pkgdir"/usr/lib/"$pkgname"
    cp -a squashfs-root/resources/ "$pkgdir"/usr/lib/"$pkgname"/
    chmod 755 "$pkgdir"/usr/lib/"$pkgname"/resources

    install -D "wrapper.sh" "$pkgdir"/usr/lib/"$pkgname/$pkgname"

    mkdir -p "$pkgdir"/usr/bin
    ln -s /usr/lib/"$pkgname/$pkgname" "$pkgdir"/usr/bin/"$pkgname"
}
