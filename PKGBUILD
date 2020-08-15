# Maintainer: Amiad Bareli <amiad@hatul.info>
# Contributor: relrel <relrelbachar@gmail.com>
pkgname=scratch2
_ver=461
pkgver="2.0.$_ver"
pkgrel=1
pkgdesc="Create stories, games, and animations, share with others around the world"
arch=('any')
url="https://scratch.mit.edu/"
license=('GPL')
depends=(adobe-air-sdk libxt libxtst alsa-lib)
depends_x86_64+=(lib32-libxt lib32-libxtst lib32-alsa-lib)
makedepends=(unzip)
source=("https://scratch.mit.edu/scratchr2/static/sa/Scratch-$_ver.air" "$pkgname" "$pkgname.desktop" "$pkgname.xml" "scratchLocalData.sol")
sha512sums=('cc0d98bcc90540a5b913941f57f21e87ea1bb4468260a2cb66c9688a9c25bbe4081ace6370fd2d9f66cfc8877ca5664de1e7efede7afdce004af840b71bbc46f'
            '378551bee811e16a1139139b78d0f4e0471c67c5e1076eaaf2e137378bc44e7e3b55788fe58681da44ea8d359c6ce343f0729b2aa80dbbbd695954c3efb1515a'
            'e32fd12f4fbb35fa7c60d658a83d0186424c404a89064bc16f1c7df501bc325e77bdfa2f9fb291ccdd42bd4ca96fb8c51b282194d058f2b7e25b552c86f34b0f'
            '712fb54f23ef0c9b832630fbf0e56ce4f512fc7e32ebdc2cd03164c20ac50d8f5546baa099a630a4499460e8f142c37bc155aa47a4271d5095ec2d6c5a87a1c5'
            '101f5c3a475e3a4426f1ee961749e327be19f3d12591253bd5193aebfa6801069614f4ec0fadd229cef1cfb131fd02bf604215f92dd40ebd1bc565ad226a51ad')
noextract=("Scratch-$_ver.air")

package() {
	mkdir -p "$pkgdir/opt/airapps/$pkgname/"
	unzip "Scratch-$_ver.air" -d "$pkgdir/opt/airapps/$pkgname/"
	install -Dm644 -t "$pkgdir/opt/airapps/$pkgname/" "$srcdir/scratchLocalData.sol"

	install -Dm755 -t "$pkgdir/usr/bin/" "$srcdir/$pkgname"
	install -Dm644 -t "$pkgdir/usr/share/applications/" "$srcdir/$pkgname.desktop"
	install -Dm644 -t "$pkgdir/usr/share/mime/packages/" "$srcdir/$pkgname.xml"

	for i in 16 32 48 128; do
		install -Dm644 "$pkgdir/opt/airapps/$pkgname/icons/AppIcon$i.png" "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$pkgname.png"
		install -Dm644 "$pkgdir/opt/airapps/$pkgname/icons/ProjectIcon$i.png" "$pkgdir/usr/share/icons/hicolor/${i}x${i}/mimetypes/x-$pkgname-project.png"
	done
}
