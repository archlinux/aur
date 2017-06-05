# Maintainer:	M.Reynolds <blackboxnetworkproject@gmail.com>

pkgname=thonny
pkgver=2.1.9
pkgrel=1
pkgdesc="Python IDE for beginners."
arch=('any')
url="http://thonny.cs.ut.ee/"
license=('MIT')
depends=('openssl' 'python' 'python-beautifulsoup4' 'python-jedi' 'tcl' 'tk')
source=("https://bitbucket.org/plas/$pkgname/downloads/$pkgname-$pkgver-x86_64.tar.gz")
sha256sums=('6dc36b141836064d4f91a6164d65b76789354bc3992e60f0a300ff94f5f5fa2f')

package() {
	
	cd "$srcdir"
	
	# Correct install path for binary and icon file	
	sed -i 's|$target_dir|/usr|' "$pkgname/templates/Thonny.desktop"
	
	install -Dm 644 "$pkgname/templates/Thonny.desktop" \
		"$pkgdir/usr/share/applications/thonny.desktop"
	
	install -Dm 755 "$pkgname/bin/thonny" "$pkgdir/usr/bin/thonny"
	
	install -Dm 644 "$pkgname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	
	# Install.py currently does not allow for setting root for creating a package
	# Files must by copied manually for now in section below.	
	install -d  644 "$pkgdir/usr/lib/python3.6/site-packages/thonny"
	cp -dr --no-preserve=ownership "$pkgname/lib/python3.6/site-packages/thonny" \
		"$pkgdir/usr/lib/python3.6/site-packages"
			
	install -Dm 644 "$pkgname/lib/python3.6/site-packages/distro.py" \
		"$pkgdir/usr/lib/python3.6/site-packages/distro.py"
}
