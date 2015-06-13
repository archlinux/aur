# Maintainer: yugrotavele <yugrotavele at archlinux dot us>

pkgname=nerolinux
pkgver=4.0.0.0
_subver=b
pkgrel=5
pkgdesc="Nero Burning ROM for linux"
url="http://www.nero.com/eng/linux4.html"
license=('custom')
depends=('gtk2')
makedepends=('rpmextract')
arch=('i686' 'x86_64')
source=(http://www.archlinuxcn.org/download/$pkgname-$pkgver$_subver-x86.rpm)
md5sums=('f49f49c588729c2afdbecb546d9b6041')
install=nerolinux.install

[ "$CARCH" = "x86_64" ] && source=(http://www.archlinuxcn.org/download/$pkgname-$pkgver$_subver-x86_64.rpm)
[ "$CARCH" = "x86_64" ] && md5sums=('f5b307c37e5623231e0a042ee43e018c')

package() {
  cd "$pkgdir"

    if [ "$CARCH" = "x86_64" ]; then
        rpmextract.sh $srcdir/$pkgname-$pkgver$_subver-x86_64.rpm
	mv usr/lib64 usr/lib
    else
        rpmextract.sh $srcdir/$pkgname-$pkgver$_subver-x86.rpm
    fi

    chmod a+rx -R *
    find . -type f -exec chmod -x \{\} \;
    chmod +x usr/bin/{nero,nerocmd,neroexpress}

    mkdir -p usr/share/licenses/nerolinux
    mv usr/share/doc/nero/EULA* usr/share/licenses/nerolinux
}
