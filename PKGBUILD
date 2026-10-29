# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="veracrypt-console-bin"
pkgver=1.26.29
pkgrel=1
pkgdesc="Disk encryption with strong security based on TrueCrypt - headless console only"
url="https://www.veracrypt.fr/"
arch=("x86_64")
license=("Apache 2.0" "TrueCrypt 3.0")
provides=("veracrypt")
conflicts=("veracrypt" "veracrypt-git" "veracrypt-git-no-gost" "veracrypt-trans")
depends=("fuse2>=2.8.0" "libsm" "device-mapper")
optdepends=("sudo: mounting encrypted volumes as nonroot users")
source_x86_64=("$pkgname-$pkgver-amd64.deb::https://launchpad.net/veracrypt/trunk/$pkgver/+download/${pkgname/-bin/}-$pkgver-Debian-11-amd64.deb")
b2sums_x86_64=('13981bf63a9bc962ad974936130d356fa3362db445ffcdc29f7aa7cd80de60be1029bf1c1eb6a3adcc772b312f0226d5b7ac53b7bf01c2b55379e5a861f7dfac')
install="veracrypt.install"

prepare(){
 tar -xf "data.tar.gz"
}

package(){
 cp -r "usr" "$pkgdir"
 mv "$pkgdir/usr/sbin/"* "$pkgdir/usr/bin/"
 rm -r "$pkgdir/usr/sbin/" "$pkgdir/usr/bin/veracrypt-uninstall.sh"
 install -D -m 644 "$pkgdir/usr/share/doc/veracrypt/License.txt" -t "$pkgdir/usr/share/licenses/veracrypt/LICENSE"
}
