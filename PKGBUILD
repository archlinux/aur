## Maintainer: Speykious <speykious@gmail.com>

pkgname=mercury-mapper-bin
_pkgver=`cat current_version`
pkgver=`echo "$_pkgver" | tr '\\:/\- ' '_'`
pkgrel=1
pkgdesc="A chart editor for Mercury. \"Forked\" from BAKKA-Avalonia, re-written for stability and ease of use."
arch=('x86_64')
url="https://github.com/Yasu3D/MercuryMapper"
license=('MIT')
depends=(libgl)
provides=(mercury-mapper)
conflicts=(mercury-mapper)
source=("$pkgname-$pkgver.zip::$url/releases/download/$_pkgver/MercuryMapper-Linux-x64.zip"
        "$pkgname.png::https://raw.githubusercontent.com/Yasu3D/MercuryMapper/refs/heads/master/Assets/AppIcon.png"
        "$pkgname-LICENCE.md::https://raw.githubusercontent.com/Yasu3D/MercuryMapper/refs/heads/master/LICENSE"
        "$pkgname.xml"
        "$pkgname.desktop"
		"mercury-mapper")
noextract=("$pkgname-$pkgver.zip")
sha256sums=('b90d418da3651b02a4e7666ba72515188b2c6ae99b693ea53243ebb0218c97fc'
            '95df58bef2d8a34d7f0daee739e28ca78c0dd9f7b6a401d9ad376e32b4718cc1'
            '7574c0121b5d56f8186d6cd6df664547a575315fa19c91480272c205bca457c4'
            '48955fa5f76e35ed7a546c29cc0036c42a597aa6e80a3985d92082fa7c906069'
            '2491cc99ddb5749a679d221040ad46746714e70a2cf9bc95c2a09a9948068392'
            'd01a1b63c3cda5aaf243ad10a6476a09098c8347f95d959b0b3330a0e71d067c')

package() {
	install -dm755 "$pkgdir"/usr/lib/MercuryMapper
	bsdtar  -x -C  "$pkgdir"/usr/lib/MercuryMapper -f "$pkgname-$pkgver.zip" --strip-components 1
	chmod +x "$pkgdir"/usr/lib/MercuryMapper/MercuryMapper

	install -Dm755 "mercury-mapper" "$pkgdir"/usr/bin/mercury-mapper

	install -Dm644 "$pkgname-LICENCE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENCE.md"
	install -Dm644 "$pkgname.png"        "$pkgdir/usr/share/pixmaps/$pkgname.png"
	install -Dm644 "$pkgname.xml"        "$pkgdir/usr/share/mime/packages/$pkgname.xml"
	install -Dm644 "$pkgname.desktop"    "$pkgdir/usr/share/applications/$pkgname.desktop"
}
