# Maintainer: Bilal ELmoussaoui <bil.elmoussaoui@gmail.com>

pkgname=ndm
_pkgbase=ndm
pkgrel=2
pkgver=1.0.0
_pkgver=v$pkgver
pkgdesc="npm desktop manager"
url="https://github.com/720kb/ndm"
provides=('ndm')
arch=('x86_64')
license=('GPL3')
makedepends=('unzip')
source=(
    "${_pkgbase}.desktop"
    ${_pkgbase}{16,24,32,48,64,96,128,256,512}.png
)

source_x86_64+=("${url}/releases/download/${_pkgver}/${_pkgbase}-${pkgver}.zip")
sha256sums=(
        'c39a5951e9fe3c9156d3b01e03bdcce4717f9282a9879e8a0a1ad2b36605061e'
        'c00b94fcd27bdf4a4749114a68c0f439704ea46ca72f131e366efcf6f721cc77'
        '320664a794faa12ac1977772c479fb2a3628cb15e37e5d9b04e7b0acd210935b'
        '51122b1be8b8bf839c48f981651a2e9ef1879d7d27fbf8f82d2ce3066907c110'
        '3f97a2e4ff971f747b3383e38b003557b24c68a072bd705068c2b7fbee4d851e'
        '6cd698e47c1e803fffc88db6c954708f9b5300fdb37cb6957aaf7845061815f8'
        '3afcbf1044f780f5cbbde0a0bd8ec8037547e3853544e80c3bd87836092910b2'
        'd21b7bcb7aa615f0e0e7af21d8b209f448da928b47c75b61455069eadd3d738d'
        'e43cc2bcc12f29cac03f667e480f059e5391c29d075ad7821f1411cea67ac1b1'
        'dec92be5e28941f99a0c81c0cb1df8ec76abea6fed58481f412d4a92972bc40c'
        )

sha256sums_x86_64=('8c944bfd10af742e0c5e25d5032ecd246986b795fea072c3be85bec86d599b9d')

package() {
    install -dm755 "$pkgdir/usr/share/applications/"
    install -d "$pkgdir"/opt/${_pkgbase}/
    mv "$srcdir/linux-unpacked/" "$srcdir/$pkgbase"
    cp -R "$srcdir/$pkgbase" $pkgdir/opt/
    install -d "$pkgdir/usr/bin/"
    ln -sf "/opt/$pkgbase/$pkgbase" "$pkgdir/usr/bin/$pkgbase"
    install -Dm755 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    for icon_size in 16 32 48 64 128 256 512; do
        icon_dir="$pkgdir/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps"
        install -d "$icon_dir"
        install -m644 "$srcdir/${_pkgbase}${icon_size}.png" "$icon_dir/${_pkgbase}.png"
    done
}
