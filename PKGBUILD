# Maintainer: Fermín Olaiz <fermin@olaiz.net>

pkgname=nutest-git
pkgver=v1.2.0.r0.gc46af12
pkgrel=2
pkgdesc="A Nushell test framework"
arch=(any)
url='https://github.com/vyadh/nutest'
license=(MIT)
depends=('nushell>=0.114.0')
makedepends=(git)
provides=(nutest)
conflicts=(nutest)
source=("$pkgname::git+$url.git"
        autoload.nu)
sha256sums=(SKIP
            423b57d54f01695cecd92b28d3814467a7bbe495375b59227cc5e356d11c2ecf)

pkgver() {
    cd "$pkgname"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
    cd "$pkgname"
    #nu -c 'use nutest; nutest run-tests'
}

package() {
    cd "$pkgname"
    install -dm755 "$pkgdir/usr/share/nushell/modules"
    cp -r nutest "$pkgdir/usr/share/nushell/modules/"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/autoload.nu" "$pkgdir/usr/share/nushell/vendor/autoload/nutest.nu"
}
