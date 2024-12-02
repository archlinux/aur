# Maintainer: Nikoloz Shvelidze <captain@pirrate.me>
pkgname=osrs-launcher
pkgver=1.2
pkgrel=4
epoch=
pkgdesc="OldSchool RuneScape launcher"
arch=(any)
url="https://oldschool.runescape.com/"
license=('unknown')
depends=(jre8-openjdk)
makedepends=(p7zip libicns)
source=("https://www.runescape.com/l=1/downloads/OldSchool.dmg" "osrs-launcher" "osrs-launcher.desktop")
md5sums=('af345cb11c7e392c15e4d2681d9de17f' SKIP SKIP)

prepare() {
    cd "$srcdir"
    # Extract launcher jar and Apple icon from the dmg
    7z e "OldSchool.dmg" -o"$pkgname-$pkgver" -aoa -y -bb0 -bd \
        "Old School RuneScape/Old School RuneScape.app/Contents/Java/jagexappletviewer.jar" \
        "Old School RuneScape/Old School RuneScape.app/Contents/Resources/OSRS.icns"

	cd "$pkgname-$pkgver"
    # Extract 512x512x32bits png icon from the Apple icon
    icns2png -x "OSRS.icns" -s 512x512 -d 32
}

package() {
    install -Dm644 "$pkgname-$pkgver/OSRS_512x512x32.png" "$pkgdir/usr/share/pixmaps/osrs-launcher.png"
    install -Dm644 "$pkgname-$pkgver/jagexappletviewer.jar" "$pkgdir/usr/share/java/osrs-launcher/jagexappletviewer.jar"
    install -Dm755 "osrs-launcher" "$pkgdir/usr/bin/osrs-launcher"
    install -Dm644 "osrs-launcher.desktop" "$pkgdir/usr/share/applications/osrs-launcher.desktop"
}
