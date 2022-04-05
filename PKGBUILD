# Maintainer: David Plassmann <arch[at]plassmann.biz>
pkgname=xping-git
pkgrelname=xping
pkgver=195
pkgrel=4
pkgdesc="A simple ping program continiously probing multiple hosts using icmp-echo"
url="https://github.com/martintopholm/xping"
arch=('x86_64')
license=("THE BEER-WARE LICENSE")
depends=('libevent')
source=("git+https://github.com/martintopholm/xping.git")
conflicts=('xping')
md5sums=('SKIP')
install='xping.install'
CPPFLAGS="-Wall -Werror -I/usr/local/include"

build() {
    cd "$pkgrelname" || exit 1
    make
}

pkgver() {
  cd ${srcdir}/${pkgrelname} || exit 1
  git rev-list --count HEAD
}

package() {
    cd "$pkgrelname" || exit 1
    install -Dm4555 "$srcdir/$pkgrelname/$pkgrelname" "$pkgdir/usr/bin/$pkgrelname"
    install -Dm4555 "$srcdir/$pkgrelname/$pkgrelname-http" "$pkgdir/usr/bin/$pkgrelname-http"
    install -Dm444 "$srcdir/$pkgrelname/$pkgrelname.8.gz" "$pkgdir/usr/share/man/man8/$pkgrelname.8.gz"
}
