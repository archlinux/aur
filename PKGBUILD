# Maintainer: Francisco Giordano <ok@frang.io>

pkgname=volta
pkgver=0.5.7
pkgrel=1
pkgdesc="JavaScript Launcher"
arch=('x86_64')
url="https://volta.sh/"
license=('BSD')
depends=('openssl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/volta-cli/volta/releases/download/v$pkgver/volta-$pkgver-linux-openssl-1.1.tar.gz"
        "https://raw.githubusercontent.com/volta-cli/volta/v${pkgver}/dev/unix/volta-install.sh"
        "volta-install.patch"
        "volta-profile.sh")
noextract=("volta-$pkgver-linux-openssl-1.1.tar.gz")
md5sums=('f96b23d5a97c79ae5df738bb3704a147'
         '5a8b446f69736daff4197d29a679c4b7'
         'a02c7b1fa54d5d6418b6ec1d6ae28a55'
         '4d4c7f25d4962bb0a4f01d1288e5e8bd')

prepare() {
	patch --follow-symlinks -i "volta-install.patch"
}

package() {
        export VOLTA_HOME="$pkgdir/usr/share/volta"
        bash volta-install.sh --archive "$pkgname-$pkgver.tar.gz"

        mkdir -p "$pkgdir/usr/bin"
        ln -s "/usr/share/volta/volta" "$pkgdir/usr/bin"

        mkdir -p "$pkgdir/etc/profile.d"
        mv volta-profile.sh "$pkgdir/etc/profile.d/volta.sh"
}

# vim: et sw=8 ft=PKGBUILD
