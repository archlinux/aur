# Maintainer: svdev <sergio at svcdev dot com>

pkgname=dexbot
pkgver=1.0.0.r0.g44588f0
pkgrel=1
pkgdesc="Trading bot for the DEX (BitShares)"
arch=(any)
url="https://dexbot.info"
license=("MIT")
depends=('python>=3' 'python-setuptools' 'python-pip')
makedepends=('git')
source=("git+git://github.com/Codaone/DEXBot.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/DEXBot"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/DEXBot"
    make build
}

package() {
    cd "$srcdir/DEXBot"    
    python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/dexbot/LICENSE.txt"
    install -Dm644 README.md "$pkgdir/usr/share/doc/dexbot/README.md"
}
