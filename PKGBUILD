# Maintainer:	M.Reynolds <blackboxnetworkproject@gmail.com>

pkgname=thonny
pkgver=2.0.7
pkgrel=2
pkgdesc="Python IDE for beginners."
arch=('any')
url="http://thonny.cs.ut.ee/"
license=('MIT')
depends=('openssl' 'python' 'python-beautifulsoup4' 'python-jedi' 'tcl' 'tk')
source=("https://bitbucket.org/plas/$pkgname/downloads/$pkgname-$pkgver-x86_64.tar.gz")
sha256sums=('d226a76bbb640ffa84589ad13bf32b9709fe1cb63101dd8805da4949dbd243b6')

package() {
	
	cd "$srcdir"
	
	# Patch version number for python3.6
	sed -i 's|python3.5|python3.6|' "$pkgname/bin/thonny"
	sed -i 's|python3.5|python3.6|' "$pkgname/templates/Thonny.desktop"
	
	install -Dm 755 "$pkgname/bin/thonny" "$pkgdir/usr/bin/thonny"
		
	sed -i 's|$target_dir|/usr|' "$pkgname/templates/Thonny.desktop"
	install -Dm 644 "$pkgname/templates/Thonny.desktop" \
		"$pkgdir/usr/share/applications/thonny.desktop"
	
	install -Dm 644 "$pkgname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	
	# Install.py currently does not allow for setting root for creating a package
	# Files must by copied manually for now in section below.	
	install -d  644 "$pkgdir/usr/lib/python3.6/site-packages/thonny"
	cp -dr --no-preserve=ownership "$pkgname/lib/python3.5/site-packages/thonny" \
		"$pkgdir/usr/lib/python3.6/site-packages"
			
	install -Dm 644 "$pkgname/lib/python3.5/site-packages/distro.py" \
		"$pkgdir/usr/lib/python3.6/site-packages/distro.py"
				
	install -d  644 "$pkgdir/usr/lib/python3.6/site-packages/tkinterhtml"
	cp -dr --no-preserve=ownership "$pkgname/lib/python3.5/site-packages/tkinterhtml" \
		"$pkgdir/usr/lib/python3.6/site-packages"
}
