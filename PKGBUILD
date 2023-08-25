# Maintainer: LuckyTurtleDev [aur at lukas1818 dot de]

_pkgtag=2.41
pkgname="mtg-desktop-companion"
pkgver=$_pkgtag
pkgrel=1
pkgdesc='Cards manager for magic the gathering'
url='https://github.com/nicho92/MtgDesktopCompanion'
license=('Apache')
depends=('java-runtime>=16')
makedepends=('maven' 'unzip')

source=("$pkgname-$_pkgtag::https://github.com/nicho92/MtgDesktopCompanion/archive/refs/tags/$_pkgtag.tar.gz"
        "start.sh"
        "MtgDesktopCompanion.desktop")
sha512sums=('54e02c7e9dd8d9cf1927f0b748f0a8af45335f98d3f8af65dffa87c61c4e05fe786f7fabfb1409d1ed9be9477a111549f8287781854fa2ad0c82fbd54cf758af'
            '3abcbe1a1b0ca48237b0cf284988c8486b5ea3290bc924ef87c55ebb1b7e8f519697294bb6df9a24d5ca95d760290ed4075e7367c700913fe4d2e649556cd0c7'
            '0bc12e7f5d6057fa13ccc6619dc16cf9f46bf6d0d03568aae1da76c337d426918a61a3f48ea29fe64b847814356bcdd1c49a0187cdf561330fc740586f822530')

arch=('any')

build() {
	cd "$srcdir/MtgDesktopCompanion-$_pkgtag"
	mvn -DskipTests clean package
}

package() {
	cd "$srcdir/MtgDesktopCompanion-$_pkgtag/target"
	unzip "mtg-desktop-companion-$_pkgtag.zip"
	mkdir -p "$pkgdir/usr/share/java/$pkgname"
	cp -r "mtg-desktop-companion-$_pkgtag/lib/"*.jar "$pkgdir/usr/share/java/$pkgname"
	install -Dm 755 "$srcdir/start.sh" "$pkgdir/usr/bin/$pkgname"
	install -Dm 644 "$srcdir/MtgDesktopCompanion-$_pkgtag/src/main/resources/icons/logo.png" "${pkgdir}/usr/share/pixmaps/$pkgname.png"
	install -Dm 755 "${srcdir}/MtgDesktopCompanion.desktop" "$pkgdir/usr/share/applications/MtgDesktopCompanion.desktop"
	echo "you might want to clean $HOME/.m3 now"
}
