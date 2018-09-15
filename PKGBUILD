# Maintainer: Jens L. Nedregård <jens@nedregard.no>
pkgname=cracker
pkgver=0.1.1
pkgrel=1
pkgdesc='Auto-completion client/server for the Crystal language'
arch=("x86_64")
url="https://github.com/TechMagister/cracker"
license=('MIT')
depends=(pcre gc libevent)
makedepends=(crystal shards)
source=("https://github.com/TechMagister/cracker/archive/v${pkgver}.tar.gz")
md5sums=('a9b542bc81e24bb98873c9485629e0c6')

build() {
    cd "$pkgname-$pkgver"
    # Pacman will emit warning: reference to build dir 
    # Builds bin/cracker
    shards build
}

check() {
    cd "$pkgname-$pkgver"
    # Run tests
    crystal spec
}

package() {
    cd "$pkgname-$pkgver"

    install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D -m 755 bin/cracker "$pkgdir/usr/bin/$pkgname"
}
