#Maintainer: Vince <vince@ultrabanana.net>
pkgname='rexpaint'
pkgver='1.60'
pkgrel=1
pkgdesc='A powerful and user-friendly ASCII art editor'
arch=('x86_64' 'i386')
url='https://www.gridsagegames.com/rexpaint'
license=('custom')
depends=('wine')
source=("https://www.gridsagegames.com/blogs/files/REXPaint-v$pkgver.zip"
         "launcher.sh"
         "launcher.desktop")
sha256sums=('55c8c7dc299ff4a246d2f381c0ce8a3f72bc1df0922364ed17cb3d05bc48bdb1'
            'e1bd48ec4d337c24127b311efaa5dff523cf680eef0aacaf2fe11c16a19b05d2'
	    '2c4eb485e81a003dbee59ccdb751bff54d59948f3f5502e646aab5b6ee03ad85')
DLAGENTS=("https::/usr/bin/curl -A 'PKGBUILD' -fLC - --retry 3 --retry-delay 3 -o %o %u")

prepare(){
	mv "REXPaint-v$pkgver" $pkgname
	sed -n '76,84p' $pkgname/REXPaint-README.txt >LICENSE
}

package(){
	mkdir -p "$pkgdir/usr/share"
	cp -R "$pkgname" "$pkgdir/usr/share/"
	find $pkgdir/usr/share/$pkgname -type f -exec chmod 644 {} \;
	find $pkgdir/usr/share/$pkgname -type d -exec chmod 755 {} \;
	install -Dm755 launcher.sh "$pkgdir/usr/bin/$pkgname"
	install -Dm644 launcher.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
