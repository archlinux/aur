## Maintainer: Speykious <speykious@gmail.com>

pkgname=inochi-creator-bin
_pkgver=`cat current_version`
pkgver=`echo "$_pkgver" | tr '\\:/\- ' '_'`
pkgrel=1
pkgdesc="Open source editor for rigging Inochi2D puppets."
arch=('x86_64')
url="https://inochi2d.com"
license=('BSD 2-Clause')
provides=(inochi-creator)
depends=(unzip)
conflicts=()
options=()
source=("$pkgname-$_pkgver.zip::https://github.com/Inochi2D/inochi-creator/releases/download/$_pkgver/inochi-creator-linux-x86_64.zip"
        "$pkgname-16x16.png::https://raw.githubusercontent.com/Inochi2D/branding/main/creator/Inochi-Creator.iconset/icon_16x16.png"
        "$pkgname-32x32.png::https://raw.githubusercontent.com/Inochi2D/branding/main/creator/Inochi-Creator.iconset/icon_32x32.png"
        "$pkgname-64x64.png::https://raw.githubusercontent.com/Inochi2D/branding/main/creator/Inochi-Creator.iconset/icon_32x32@2x.png"
        "$pkgname-128x128.png::https://raw.githubusercontent.com/Inochi2D/branding/main/creator/Inochi-Creator.iconset/icon_128x128.png"
        "$pkgname-256x256.png::https://raw.githubusercontent.com/Inochi2D/branding/main/creator/Inochi-Creator.iconset/icon_256x256.png"
        "$pkgname-512x512.png::https://raw.githubusercontent.com/Inochi2D/branding/main/creator/Inochi-Creator.iconset/icon_512x512.png"
        "$pkgname.xml"
        "$pkgname.desktop")
sha256sums=('7845ca9dbfbaf195d6fc6b4c09645a077e73daebcb7fb61b4bb6e8d423625245'
            '37c155d83e2fcce788330af9e5f48779def980f4811f4e5ba77827e92811a59d'
            '51cbc6bb2a05cf400ecbecea36549b693b50b72b401f2083f09925657123a8ed'
            '40ab94b16ab88330352b1848de5a3698093bd041550defc56636c5415d2ca857'
            'baaeb1ea6f4895145b3aa7a71bf6a1903938bc7a1bcabd62d64d55d51248f26f'
            'fa7828045dd8f8a8647b2bc5a8d22930ecf88889e126c89fa7f0fab251f084a7'
            '3ee13e3f50baee769ce8f09856c2367d9d9975c20683cd00053cdd6747b4bd29'
            '57d71d3c9b0eccf37fe10c7a79b38d65f30dd3adb0747ccc1b7556f535e8b8ac'
            '647bd65853f30b7c6a373159c09114839838b97307477a650e87f7c328230355')

package() {
    pkgbin=inochi-creator

    # Install icons
    install -Dm644 "$srcdir/$pkgname-256x256.png" "$pkgdir/usr/share/pixmaps/$pkgbin.png"

    for size in 16 32 64 128 256 512; do
        install -Dm644 "$srcdir/$pkgname-${size}x${size}.png" \
               "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$pkgbin.png"
    done

    # Install mime types
	install -Dm644 "$pkgname.xml" "$pkgdir/usr/share/mime/packages/$pkgbin.xml"

	# Install desktop file
	install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgbin.desktop"

	# Unzip Inochi Creator archive
    mkdir -p "$pkgdir/usr/lib/inochi-creator"
    unzip "$pkgname-$_pkgver.zip" -d "$pkgdir/usr/lib/inochi-creator/"

    # Install binary
    mkdir -p "$pkgdir/usr/bin"
    ln -s /usr/lib/inochi-creator/inochi-creator "$pkgdir/usr/bin/inochi-creator"
}
