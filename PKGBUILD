# Maintainer: Damien Flament <damien.flament at gmx dot com>

pkgname='shellspec'
pkgver=0.24.2
pkgrel=1
pkgdesc="BDD style unit testing framework for POSIX compliant shell script"
url="https://shellspec.info"
license=('MIT')

arch=('any')
depends=('bash')
makedepends=()

_distdir="$pkgname-$pkgver"
source=("$_distdir.tar.gz::https://github.com/shellspec/shellspec/archive/${pkgver}.tar.gz")
md5sums=('68821ce24b14a5d90ee83a6b3b18bd13')

check() {
    cd "$_distdir" || return

    ./shellspec --no-banner --task fixture:stat:prepare
    ./shellspec --no-banner spec --jobs "$(nproc)"
}

package() {
    cd "$_distdir" || return

    PREFIX=$pkgdir/usr make install
    install -m 644 -Dt "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
