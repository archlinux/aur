# Maintainer: NicKoehler <grillinicolavocal at gmail dot com>
pkgname=yarg
pkgver=0.11.1
pkgrel=5
pkgdesc="YARG - Yet Another Rhythm Game inspired off of Rockband, Guitar Hero, Clone Hero, or similar."
arch=("x86_64")
url="https://github.com/YARC-Official/YARG"
install=.INSTALL
license=(YARG License)
depends=("hidapi" "systemd-libs")
source=(
    "$pkgname"
    "$pkgname.desktop"
    "YARG_${pkgver}.zip::https://github.com/YARC-Official/YARG/releases/download/v${pkgver}/YARG_v${pkgver}-Linux-x86_64.zip"
    "https://raw.githubusercontent.com/YARC-Official/YARG/master/LICENSE"
)
sha256sums=(
    "b0d35e17a3100e8c423f4b00c591b7cc9f35f1629bf3c29322db478ad0507005"
    "56b58195f481e1a2e0ccf6bf5ff84f4a81bcf5befbb38a72e47b2b4c4652dcab"
    "aefbbb6eb789ef0bdb0666cf7963022ab8f3d32808a638c02e1b787cbc46748d"
    "c4660da2255accdcdee8346b065fc7e4e6b354c5e61d05f3c1c19ff62acd0c01"
)


package() {

    # create dirs
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/etc/udev/rules.d"
    install -dm777 "$pkgdir/opt/$pkgname"

    # install binaries
    install -Dm777 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm777 "$srcdir/UnityPlayer.so" "$pkgdir/opt/$pkgname/"
    install -Dm777 "$srcdir/YARG.x86_64" "$pkgdir/opt/$pkgname/YARG"
    cp -r "$srcdir/YARG_Data" "$pkgdir/opt/$pkgname/YARG_Data"

    # install icon and .desktop
    install -Dm644 "$pkgdir/opt/$pkgname/YARG_Data/Resources/UnityPlayer.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
    install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

    # install license
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # create 69-hid.rules
    echo 'KERNEL=="hidraw*", TAG+="uaccess"' > "$pkgdir/etc/udev/rules.d/69-hid.rules"

}
