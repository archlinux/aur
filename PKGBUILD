# Maintainer: Hurstel Alexandre <a.hurstel at unistra dot fr>
pkgname=xp-pen-tablet
pkgver=20200428
pkgrel=1
pkgdesc="XP-Pen (Official) Linux utility"
arch=('x86_64')
url='https://www.xp-pen.fr/download-292.html'
license=('GPL')
depends=('qt5-base' 'gcc-libs' 'libusb' 'icu' 'polkit')
source=("https://download01.xp-pen.com/file/2020/04/Linux_Pentablet_V1.2.13.1.tar.gz(20200428).zip"
        "Pentablet_Driver.sh.patch"
        "Pentablet-Driver.desktop"
        "https://66.media.tumblr.com/avatar_df104055a5e0_128.pnj"
        "Pentablet-Driver.policy")
sha256sums=('f4f10678e83c6e8958c2bc6799a0cf3979e9ea5e7d409775f42212ac9d534214'
            'ca3111e8500d5b38c45a903c57dbd841c26a43b0f8d1fc2e8e653f59e4714d10'
            '1409c9b50f323ee802e66d3ba09692a583a10ed82c1b1a464168d646da79b90e'
            'af868161c23ad2df4780ab2220d1bce078587d4b9912a1d61722a18d37e36a74'
            '82afee220e09fdef8767542135dfa1169e182af6bbf28577c88ba510f82dfab3')

prepare() {
    tar -xvf Linux_Pentablet_V1.2.13.1.tar.gz

    cd "Linux_Pentablet_V1.2.13.1"

    patch < "$srcdir/Pentablet_Driver.sh.patch"
}

package() {
	cd "Linux_Pentablet_V1.2.13.1"

    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share/$pkgname"
    mkdir -p "$pkgdir/usr/share/$pkgname/images"
    mkdir -p "$pkgdir/usr/share/applications"
    mkdir -p "$pkgdir/usr/share/polkit-1/actions"

    install -Dm755 "$srcdir/Pentablet-Driver.desktop" "$pkgdir/usr/share/applications"
    install -Dm755 "$srcdir/Linux_Pentablet_V1.2.13.1/Pentablet_Driver" \
                    "$srcdir/Linux_Pentablet_V1.2.13.1/Pentablet_Driver.sh" \
                    "$srcdir/Linux_Pentablet_V1.2.13.1/config.xml" \
                        "$pkgdir/usr/share/$pkgname"
    install "$srcdir/avatar_df104055a5e0_128.pnj" "$pkgdir/usr/share/$pkgname/images/XP-Pen_logo.jpg"
    install "$srcdir/Pentablet-Driver.policy" "$pkgdir/usr/share/polkit-1/actions"

    ln -s "/usr/share/$pkgname/Pentablet_Driver.sh" "$pkgdir/usr/bin/xp-pen-tablet"
}
