# Maintainer:   M.Reynolds <blackboxnetworkproject@gmail.com>

pkgname=thonny
pkgver=3.0.5
pkgrel=1
pkgdesc="Python IDE for beginners."
arch=('any')
url="http://thonny.cs.ut.ee/"
license=('MIT')
depends=('openssl' 'python' 'python-beautifulsoup4' 'python-docutils'
         'python-astroid' 'python-pylint' 'python-pyserial' 'python-jedi' 'tcl' 'tk')
source=("https://bitbucket.org/plas/$pkgname/downloads/$pkgname-$pkgver-x86_64.tar.gz")
sha256sums=('361e9fcd087596995d432d5ebbb3cb262d8700173dbb82c7bb893fd65f31e836')

package() {

    cd "$srcdir"

    # Correct install path for binary and icon file
    sed -i 's|$target_dir|/usr|' "$pkgname/templates/Thonny.desktop"

    # Update launch script for the correct Python version
    # sed -i 's|3.6|3.7' "$pkgname/bin/thonny"
    
    install -Dm 644 "$pkgname/templates/Thonny.desktop" \
                    "$pkgdir/usr/share/applications/thonny.desktop"

    install -Dm 755 "$pkgname/bin/thonny" "$pkgdir/usr/bin/thonny"

    install -Dm 644 "$pkgname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install.py currently does not allow for setting root for creating a package
    # Files must by copied manually for now in section below.
    install -d  644 "$pkgdir/usr/lib/python3.7/site-packages/thonny"
    cp -dr --no-preserve=ownership "$pkgname/lib/python3.7/site-packages/thonny" \
                                   "$pkgdir/usr/lib/python3.7/site-packages"
}
