# Maintainer: Miquel Lionel <lionel at les-miquelots dot net>
# https://aur.archlinux.org/packages/honk-hg/

pkgname=honk-hg
_pkgname=honk
pkgver=1340.0a351daab5d0
pkgrel=1
epoch=0
pkgdesc="ActivityPub compatible server with web frontend. Mercurialtip."
arch=("x86_64")
url="https://humungus.tedunangst.com/r/honk"
license=("custom:ISC")
makedepends=("gcc-go" "sqlite")
depends=("gcc-go" "sqlite")
optdepends=("nginx: for TLS and reverse proxying")
changelog="$pkgname.changelog"
provides=("${pkgname}")
conflicts=("${pkgname}" 'honk')
source=("hg+https://humungus.tedunangst.com/r/honk")
sha512sums=('SKIP')
options=(!strip)
install="$_pkgname.install"

pkgver() {
    cd honk
    echo $(hg identify -n).$(hg identify -i)
}
    

build() {
    cd "$srcdir/honk"
    make all
}

package() {
   _PKG_HONKDIR="$pkgdir/usr/share/webapps/$_pkgname"
   install -vDm700 "$srcdir/$_pkgname/$_pkgname" "$_PKG_HONKDIR/$_pkgname"
   install -vDm644 "$srcdir/$_pkgname"/views/* -t "$_PKG_HONKDIR/views/"
   install -vDm644 "$srcdir/$_pkgname"/docs/* -t "$_PKG_HONKDIR/docs/"
   install -vDm644 "$srcdir/$_pkgname"/LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
   install -vDm644 "../$_pkgname.service" -t "$pkgdir/etc/systemd/system"
}
