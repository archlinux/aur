# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: M.Reynolds <blackboxnetworkproject@gmail.com>

pkgname=thonny-bin
_pkgname=thonny
pkgver=3.2.7
pkgrel=1
pkgdesc="Python IDE for beginners"
arch=('any')
url="http://thonny.org"
license=('MIT')
depends=('openssl' 'python' 'python-beautifulsoup4' 'python-docutils' 'mypy' 'python-asttokens'
         'python-astroid' 'python-pylint' 'python-pyserial' 'python-jedi' 'tcl' 'tk')
source=("https://github.com/$_pkgname/$_pkgname/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64.tar.gz")
sha512sums=('9a0bac7d12dd96ed5f24f78caf051ed0e0715a50bce3811846c556c5fdb587ef65c5ec7c8d3354d0df96ec2581243f4dac458300507836aa67a98ef3b75b4ce8')

package() {

    cd "$srcdir"

    # Correct install path for binary and icon file
    sed -i 's|$target_dir|/usr|'                                "$_pkgname/templates/Thonny.desktop"

    # Update launch script for the correct Python version
    sed -i 's|3.7|3.8|' "$_pkgname/bin/thonny"
    sed -i 's|3.7|3.8|' "$_pkgname/templates/Thonny.desktop"

    install -Dm 644     "$_pkgname/templates/Thonny.desktop"     "$pkgdir/usr/share/applications/thonny.desktop"
    install -Dm 644     "$_pkgname/LICENSE.txt"                  "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm 755     "$_pkgname/bin/thonny"                   "$pkgdir/usr/bin/thonny"

    # Install.py currently does not allow for setting root for creating a package
    # Files must by copied manually for now in section below.
    install -d  644                 "$pkgdir/usr/lib/python3.8/site-packages/thonny"
    cp -dr --no-preserve=ownership  "$_pkgname/lib/python3.7/site-packages/thonny" "$pkgdir/usr/lib/python3.8/site-packages"
}
