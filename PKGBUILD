# Maintainer: raf <raf at raf dot org>
pkgname=sshdo
pkgver=1.1.1
pkgrel=2
pkgdesc="Controls which commands may be executed via incoming ssh"
arch=("any")
url=https://raf.org/sshdo/
license=("GPL")
depends=("python>=2.6")
checkdepends=("python>=2.6")
backup=("etc/sshdoers" "etc/sshdo.banner" "etc/sshdoers.d")
source=("https://github.com/raforg/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz" "sshdo-1.1.1-import.patch")
sha256sums=("9b22e14fec786b692e8d6431a81e9b17ad8f6e62ae5d6ef9e9c643690bf33f90" "943eb6facce297b48be51a1ac917aa435aa35e4d9fa0155db1fe3d0ebaa929b5")
sha512sums=("8c77e18d221255bca0d386ac54bd9a959f74a24fe48fed8b1152f954a2aa6780f44cbc86e91dce0204151a4661cba096b19e92a89a0b91167b457a0b85199073" "87265d45ef99d5118726f2aa0b3a0afbae24891163add788390ccb3a35629b28e0d311369c8015170928b0d6c5b0a0ca958a1a915662eaaf288595112d2bef71")

prepare()
{
	cd "$pkgname-$pkgver"
	patch --forward --strip=1 --input=../sshdo-1.1.1-import.patch
}

build()
{
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --destdir="$pkgdir"
}

check()
{
	cd "$pkgname-$pkgver"
	make test
}

package()
{
	cd "$pkgname-$pkgver"
	mkdir -p -m 755 "$pkgdir/etc" "$pkgdir/usr/bin" "$pkgdir/usr/share/man"
	make install
}

