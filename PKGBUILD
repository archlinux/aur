# Maintainer: Adrian Schmitz <zetabite.horzion@gmail.com>
pkgname=irony-mod-manager-bin
pkgver=1.15.16
pkgrel=1
pkgdesc="A mod manager and launcher for paradox interactive games"
arch=('x86_64')
url="https://github.com/bcssov/IronyModManager"
license=('MIT')
depends=("fontconfig" "bash" "zlib" "krb5" "lttng-ust")
source=("$pkgname-$pkgver.zip::https://github.com/bcssov/IronyModManager/releases/download/v$pkgver/linux-x64.zip"
		"$pkgname.png::https://raw.githubusercontent.com/bcssov/IronyModManager/v$pkgver/src/IronyModManager/Assets/logo.png"
		"$pkgname.desktop"
		"$pkgname.sh"
		"$pkgname.README.md"
		"fixed-jsons.diff")
md5sums=('aaf03a6f094ae1c0d629e7da98404f6b'
         '190d6d8e852bbe000af5dac87a5b921c'
         '4d10c1d451ed731909fc1f749c9482d1'
         '020c05854432b6e877de520a967fccee'
         '40e27fea8c512d1b6d10ad3bb794eb2e'
         '953d00c6442dec40d998f97dfd53ffe4')
noextract=("$pkgname-$pkgver.zip")

prepare() {
	mkdir -p $pkgname-$pkgver && bsdtar -xf $pkgname-$pkgver.zip -C $pkgname-$pkgver
}

package() {
	mkdir -p "$pkgdir/opt/$pkgname"
	mkdir -p "$pkgdir/usr/bin"

	cd "$srcdir/$pkgname-$pkgver/"
	patch -p1 -i "$srcdir/fixed-jsons.diff"

	cp -R "$srcdir/$pkgname-$pkgver" -T "$pkgdir/opt/$pkgname/"

	install -m644 -D "$srcdir/$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
	install -m644 -D "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -m644 -D "$srcdir/$pkgname.README.md" "$pkgdir/opt/$pkgname/README.md"
	install -m644 -D "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -m755 -D "$srcdir/$pkgname-$pkgver/IronyModManager" "$pkgdir/opt/$pkgname/IronyModManager"
	install -m755 -D "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}
