#Maintainer: Praxidike_Kore <praxidike.kore@protonmail.com>
#Contributor: Vince <vince@ultrabanana.net>
pkgname='rexpaint'
pkgver='1.70'
pkgrel=1
pkgdesc='A powerful and user-friendly ASCII art editor'
arch=('any') #Anything that WINE supports, at least
url='https://www.gridsagegames.com/rexpaint'
license=('custom')
depends=('wine')
source=("https://www.gridsagegames.com/blogs/fileDownload.php?fileName=REXPaint-v$pkgver.zip"
         "launcher.sh"
         "launcher.desktop")
sha256sums=('deea6f0008d9119512d974c8d19387828a6d8b6ed9e4c7aaeb6a90cd36b923b4'
            'b68e78c4b4d0373944158c1dc6146dd3401b06f040d35166b6328aed0b872306'
            '3fc98f84e55888c60d423c60532e048601a84debd1d15fcb015b5a2a15b6c648')
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
