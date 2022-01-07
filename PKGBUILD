# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="veracrypt-console-bin"
pkgver=1.25.4
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
sha256sums_x86_64=('a8827cbe806c6d572fe325b6a15c70b4a39b9b48024d59806139d9abfa2d4337')
sha256sums_aarch64=('f483cdd5d5da0f4f5dbe664a289aaf85610047fbcd735e81920044b2df91ac63')
sha256sums_armv7h=('f942dfbb5d241555d2ffc18a0fda9f9741d9152661c8cd48c19a510f096a5974')
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
