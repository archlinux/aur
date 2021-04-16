# Maintainer: Miquel Lionel <lionel at les-miquelots dot net>
# https://aur.archlinux.org/packages/honk/

pkgname=honk
pkgver=0.9.6
pkgrel=3
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
sha512sums=("d946be7796be2ef7dc565710351b0b27da947f4e65a2a8f52ec99624c66fb6fd5e21d3fa58fec691d944b4acfa6256b0ad1090f3f8f5191e6c3714f3eae99b29")
#backup=("usr/share/webapps/honk/honk.db" "usr/share/webapps/honk/blob.db" "usr/share/webapps/honk/backup.db" "usr/share/webapps/honk/views/*")
options=(!strip)
install="$pkgname.install"

build() {
    cd "$pkgname-$pkgver"
    make all
}

package() {
   _PKG_HONKDIR="$pkgdir/usr/share/webapps/honk"
   install -vDm700 "$pkgname-$pkgver/honk" "$_PKG_HONKDIR/honk"
   install -vDm644 "$pkgname-$pkgver"/views/* -t "$_PKG_HONKDIR/views/"
   install -vDm644 "$pkgname-$pkgver"/docs/* -t "$_PKG_HONKDIR/docs/"
   install -vDm644 "$pkgname-$pkgver"/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
   install -vDm644 ../honk.service -t "$pkgdir/etc/systemd/system"
}
