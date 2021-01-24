# Maintainer: Miquel Lionel <lionel at les-miquelots dot net>
# https://aur.archlinux.org/packages/honk/

pkgname=honk
pkgver=0.9.5
pkgrel=1
epoch=0
pkgdesc="ActivityPub compatible server with web frontend."
arch=("x86_64")
url="https://humungus.tedunangst.com/r/honk"
license=("custom:ISC")
makedepends=("gcc-go" "sqlite")
depends=("gcc-go" "sqlite")
optdepends=("nginx: reverse proxy with tls support")
changelog="$pkgname.changelog"
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("$pkgname-$pkgver.tar.gz::https://humungus.tedunangst.com/r/honk/d/$pkgname-$pkgver.tgz")
sha512sums=("f8360c06ce320d5bb386b069a8a22398dd7cb972243a27b9c077373108c755c3c496743f9d043675b54b7a63cde0b647fcb94c37470d8be15b46db1cd4a6196d")
#backup=("usr/share/webapps/honk/honk.db" "usr/share/webapps/honk/blob.db" "usr/share/webapps/honk/backup.db" "usr/share/webapps/honk/views/*")
options=(!strip)
install="$pkgname.install"

build() {
    cd "$pkgname-$pkgver"
    make all
}

package() {
   _PKG_HONKDIR="$pkgdir/usr/share/webapps/honk"
   install -vDm755 "$pkgname-$pkgver/honk" "$_PKG_HONKDIR/honk"
   install -vDm644 "$pkgname-$pkgver"/views/* -t "$_PKG_HONKDIR/views/"
   install -vDm644 "$pkgname-$pkgver"/docs/* -t "$_PKG_HONKDIR/docs/"
   install -vDm644 "$pkgname-$pkgver"/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
   install -vDm644 ../honk.service -t "$pkgdir/etc/systemd/system"
}
