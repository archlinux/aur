# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="veracrypt-console-bin"
_pkgver=1.24
_updatever=7
pkgver="${_pkgver}.update${_updatever}"
pkgrel=1
pkgdesc="Disk encryption with strong security based on TrueCrypt. amd64 and armv7h headless versions only"
url="https://www.veracrypt.fr/"
arch=("x86_64" "armv7h") # no other architectures are available from the official download page
license=("custom:TrueCrypt")
provides=("veracrypt")
conflicts=("veracrypt" "veracrypt-git")
depends=("fuse2>=2.8.0" "libsm" "device-mapper")
optdepends=("sudo: mounting encrypted volumes as nonroot users")
source_x86_64=("$pkgname-$pkgver.deb::https://launchpad.net/veracrypt/trunk/$_pkgver-update$_updatever/+download/${pkgname/-bin/}-$_pkgver-Update$_updatever-Debian-10-amd64.deb")
source_armv7h=("$pkgname-$pkgver.deb::https://launchpad.net/veracrypt/trunk/$_pkgver-update$_updatever/+download/${pkgname/-bin/}-$_pkgver-Update$_updatever-Debian-10-armhf.deb")
sha256sums_x86_64=("c76e1017c8c1d1a904be10a3594c7a8144acc4391977b1dce5d4481f596112da")
sha256sums_armv7h=("99a3b5f170804aa0f80d9c5129db80e55da94976bf8fd3af7c68c14089fbc00a")
install="veracrypt.install"

prepare(){
 tar -xf "data.tar.gz"
}

package(){
 cp -r "usr" "$pkgdir"
 rm "$pkgdir/usr/bin/veracrypt-uninstall.sh"
 install -D -m 644 "$pkgdir/usr/share/doc/veracrypt/License.txt" -t "$pkgdir/usr/share/licenses/veracrypt/LICENSE"
}
