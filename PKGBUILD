# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="veracrypt-console-bin"
pkgver=1.26.14
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
b2sums_x86_64=('0d799f9e9b5c982c987170520304264fca347ab462ad21584ba942404187368ce2c8a59fb3c060a0505f3cca907a4d617bd26b419812f0cc4bc3394a45bb813e')
b2sums_armv7h=('5939185b738beca3e822a39e17b05fb64d05b062771d5848c2795f3a40e49e898017f5b504e2bb081e30f682a6d6f3b9ac06449c153f08d39dedadf58b57e545')
b2sums_aarch64=('8635f2b3995f68f44f4c3cf28442d6b3bdcd125d2b6c7e16203aafda0311d7c24167e095a277f65a0794c614815a7be5e4a0d6175a5c8502cb594afaabe4f859')
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
