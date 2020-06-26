# Maintainer: Damien Flament <damien.flament at gmx dot com>

pkgname='shellspec'
pkgver=0.25.0
pkgrel=1
pkgdesc="BDD style unit testing framework for POSIX compliant shell script"
url="https://shellspec.info"
license=('MIT')

arch=('any')
depends=('bash')
makedepends=()

_distdir="$pkgname-$pkgver"
source=("$_distdir.tar.gz::https://github.com/shellspec/shellspec/archive/${pkgver}.tar.gz")
md5sums=('6fc53359d3756ce460474fbf898560b4')

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
