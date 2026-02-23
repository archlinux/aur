# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Lauri Niskanen <ape@ape3000.com>

pkgname='maskprocessor'
pkgver=0.73
pkgrel=3
pkgdesc='High-Performance word generator with a per-position configurable charset'
arch=('i686' 'x86_64')
url='https://github.com/jsteube/maskprocessor'
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hashcat/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ad2b2945b896d9221eedebac9999a44043e2add3aea6aa1dae2ad1fd9eff5bc4')

build()
{
    cd "$pkgname-$pkgver/src"
    make
}

package()
{
    cd "$pkgname-$pkgver"

    [[ $CARCH = 'x86_64' ]] && ARCHID=64 || ARCHID=32

    install -d "$pkgdir/usr/bin"
    install -Dm755 "src/mp$ARCHID.bin" "$pkgdir/usr/bin/mp"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
