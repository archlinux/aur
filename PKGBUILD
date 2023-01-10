# Maintainer: c4lyx <heringer at proton dot me>
pkgname='miniasm'
pkgver=0.3
pkgrel=1
pkgdesc="Overlap-Layout-Consensus-based de novo assembler for long reads"
arch=('x86_64')
url="https://github.com/lh3/miniasm"
license=('MIT')
depends=('zlib')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lh3/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("9b688454f30f99cf1a0b0b1316821ad92fbd44d83ff0b35b2403ee8692ba093d")

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"

    # applications
	install -Dm0755 $pkgname -t "$pkgdir"/usr/bin/
	install -Dm0755 minidot -t "$pkgdir"/usr/bin/

    # license
    install -Dm0644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname

    # man page
    install -Dm0644 "$pkgname.1" -t "$pkgdir/usr/share/man/man1"

    # documentation
    install -Dm0644 {PAF.md,README.md} -t "$pkgdir/usr/share/doc/miniasm"
}
