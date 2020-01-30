# Maintainer: Damien Flament <damien.flament at gmx dot com>

pkgname='shellspec'
pkgver=0.21.0
pkgrel=1
pkgdesc="BDD style unit testing framework for POSIX compliant shell script"
url="https://github.com/shellspec/$pkgname"
license=('MIT')

arch=('any')
depends=('bash')
makedepends=()

_distdir="$pkgname-$pkgver"
source=("$_distdir.tar.gz::$url/archive/${pkgver}.tar.gz")
md5sums=('e59281b85e32f0c64a2c736491712341')

build() {
    cd "$_distdir" || return

    make
}

check() {
    cd "$_distdir" || return

    ./shellspec --task fixture:stat:prepare
    ./shellspec --no-banner spec --jobs "$(nproc)"
}

package() {
    cd "$_distdir" || return

    PREFIX=$pkgdir/usr make install
    install -m 644 -Dt "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
