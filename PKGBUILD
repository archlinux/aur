# Maintainer: a821
# Contributor: CUI Hao <cuihao.leo@gmail.com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>

pkgname=nyancat-git
pkgver=1.5.2.r5.g5ffb6c5
pkgrel=2
pkgdesc="Nyancat rendered in your terminal"
arch=(i686 x86_64)
url=https://nyancat.dakko.us/
license=('custom:NCSA')
depends=('glibc')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+https://github.com/klange/nyancat.git")
sha512sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname"
    make
    head -49 src/nyancat.c | cut -c 4- > LICENSE
}

package() {
    cd "$pkgname"
    install -Dm755 src/${pkgname%-*} "$pkgdir/usr/bin/${pkgname%-*}"
    install -Dm644 ${pkgname%-*}.1 "$pkgdir/usr/share/man/man1/${pkgname%-*}.1"
    install -Dm644 systemd/*.{service,socket} -t "$pkgdir/usr/lib/systemd/system/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
