# Maintainer: stefanwimmer128 <info@stefanwimmer128.xyz>

_pkgname=shellspec
pkgname=$_pkgname-git
pkgver=0.28.1.r182.g8aa3df5
pkgrel=1
pkgdesc='BDD style unit testing framework for POSIX compliant shell script'
arch=('any')
url='https://shellspec.info'
license=('MIT')
depends=('sh')
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname::git+https://github.com/shellspec/shellspec.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
    cd "$_pkgname"

    make test
}

package() {
    cd "$_pkgname"

    PREFIX="$pkgdir/usr" make install
    install -m 644 -Dt "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
