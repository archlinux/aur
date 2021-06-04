# Maintainer: Richard Bradfield <bradfier@fstab.me>
# Developer: James Muscat <james@timing71.org>

pkgname=timing71
pkgver=2021.1.1
pkgrel=1
pkgdesc="Desktop client for the Timing71 live timing aggregation service."
arch=('x86_64')
url="https://www.timing71.org"
license=('custom')
depends=('electron9')
# options=(!strip)
source=("$pkgname-v$pkgver.AppImage::https://releases.timing71.org/client/v$pkgver/Timing71%20Client%20v$pkgver.AppImage"
        "wrapper.sh")
sha512sums=('c088425bf903beb2df8dcef59cc1f2c9cfab6606c5bfc8630561258fa9a752eb634e5ccd08c34e904fa86dc6e6ce4184186e43d11715e148f194c1d42e49c800'
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
    ln -s "$pkgdir"/usr/lib/"$pkgname/$pkgname" "$pkgdir"/usr/bin/"$pkgname"
}
