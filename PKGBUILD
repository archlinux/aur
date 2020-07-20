# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>
# Former Maintainer: BeeJay

pkgname=sidequest-bin
_pkgname=sidequest
pkgver=0.10.11
pkgrel=2
pkgdesc="Easily sideload apps onto your standalone android VR headset"
arch=('x86_64')
url="https://github.com/the-expanse/SideQuest"
license=('MIT')
depends=(gtk3 libxss nss)
conflicts=("$_pkgname")
source=("https://github.com/the-expanse/SideQuest/releases/download/v${pkgver}/SideQuest-${pkgver}.tar.xz"
        "SideQuest.desktop")
md5sums=('ef447b5b9fbd0f518a3719c0e6b0af74'
         '03297d2f1551ee6c9b11ac450bfdc55f')

package() {
	cd "$srcdir/SideQuest-${pkgver}"

	install -dm755 "$pkgdir/opt/$_pkgname"
	cp -r -t "$pkgdir/opt/$_pkgname" .

	install -dm755 "$pkgdir/usr/bin"
	ln -s /opt/$_pkgname/sidequest "$pkgdir/usr/bin/sidequest"

    for res in 256x256 16x16 1024x1024 32x32 48x48 128x128 24x24 64x64 512x512
    do
        install -dm755 "${pkgdir}/usr/share/icons/hicolor/$res/apps/"
        ln -s "/opt/$_pkgname/resources/app.asar.unpacked/build/icons/$res.png" "${pkgdir}/usr/share/icons/hicolor/$res/apps/${_pkgname}.png"
    done

    install -Dm644 -t "$pkgdir/usr/share/licenses/$_pkgname" LICENSE*

    install -Dm644 "$srcdir/SideQuest.desktop" "${pkgdir}/usr/share/applications/SideQuest.desktop"
}
