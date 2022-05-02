# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="veracrypt-console-bin"
pkgver=1.25.9
pkgrel=1
pkgdesc="Disk encryption with strong security based on TrueCrypt - headless console only"
url="https://www.veracrypt.fr/"
arch=("x86_64" "armv7h" "aarch64")
license=("Apache 2.0" "TrueCrypt 3.0")
provides=("veracrypt")
conflicts=("veracrypt" "veracrypt-git" "veracrypt-git-no-gost" "veracrypt-trans")
depends=("fuse2>=2.8.0" "libsm" "device-mapper")
optdepends=("sudo: mounting encrypted volumes as nonroot users")
source_x86_64=("$pkgname-$pkgver-amd64.deb::https://launchpad.net/veracrypt/trunk/$pkgver/+download/${pkgname/-bin/}-$pkgver-Debian-11-amd64.deb")
source_aarch64=("$pkgname-$pkgver-arm64.deb::https://launchpad.net/veracrypt/trunk/$pkgver/+download/${pkgname/-bin/}-$pkgver-Debian-11-arm64.deb")
source_armv7h=("$pkgname-$pkgver-armv7.deb::https://launchpad.net/veracrypt/trunk/$pkgver/+download/${pkgname/-bin/}-$pkgver-Debian-11-armhf.deb")
sha256sums_x86_64=('4c64cd7212a93ad80ffe216d4ac9520703b206d105cbf56b485c6f2bc231ee2e')
sha256sums_armv7h=('549c251e756b5108fde7ea9ee736d1081739a04406c21719a7c5f42dad94df51')
sha256sums_aarch64=('bc37ddd5e8e96b149c04ad57fe412fed68c144c15a70349a7a5e162b25fd3f83')
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
