# Maintainer: CUI Hao <cuihao.leo@gmail.com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>

pkgname=nyancat-git
pkgver=1.4.4.r4.g0a7bfc1
pkgrel=1
pkgdesc="Terminal-based Pop Tart Cat animation"
arch=(i686 x86_64)
url=http://nyancat.dakko.us/
license=(NCSA)
depends=(glibc)
makedepends=(git)
provides=(${pkgname%-*})
source=($pkgname::git://github.com/klange/${pkgname%-*}.git)
sha512sums=('SKIP')

pkgver() {
    cd $pkgname/
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$pkgname"
    make
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 src/${pkgname%-*} "$pkgdir/usr/bin/${pkgname%-*}"
    install -Dm644 ${pkgname%-*}.1 "$pkgdir/usr/share/man/man1/${pkgname%-*}.1"
    install -Dm644 systemd/*.{service,socket} -t "$pkgdir/usr/lib/systemd/system/"
}
