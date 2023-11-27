# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="veracrypt-console-bin"
pkgver=1.26.7
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
b2sums_x86_64=('ba384633ab9ed5ab5ff08da324e06571f23297eb54f01d659eaf0a90d1f75252ca4de5722b7499f95d8804175f6c72e1e73fcf81e3f179f5573ad3edef29f5aa')
b2sums_armv7h=('1b9a92c02b21db3988c06775ec91a728ee205b23e322871f6d80242acf35e850539967e5d77133a6852136c256a7cb6cc2f5ee45b4f586a090fd27ef5c8f3b83')
b2sums_aarch64=('f7a9bf5a36bf6252569fa923b8aa7a054bf9534a54bbc3ac1be5b4556901ddaf11b06a5c8884d4553faa49867850a0788aa6abd3c948bcecf5033785cb9cfd8a')
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
