# Maintainer: Stelios Tsampas <loathingkernel @at gmail .dot com>

pkgname=maxcso-git
pkgver=1.9.0.r2.f0798c12
pkgrel=1
pkgdesc="Fast ISO to CSO compressor"
arch=('x86_64')
url="https://github.com/unknownbrackets/maxcso"
license=('custom:ISCL')
depends=('libuv' 'lz4' 'zlib')
makedepends=('git')
provides=("${pkgname/%-git/}")
conflicts=("${pkgname/%-git/}")
source=("${pkgname/%-git/}::git+https://github.com/unknownbrackets/maxcso.git")
md5sums=('SKIP')

pkgver() {
    cd "${pkgname/%-git/}"
    git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
    cd "${pkgname/%-git/}"
	make
}

package() {
    cd "${pkgname/%-git/}"
    install -dm 755 "$pkgdir"/usr/{bin,share/{doc,licenses}/"$pkgname"}
    install -m 755 maxcso "$pkgdir"/usr/bin/
    install -m 644 LICENSE.md "$pkgdir"/usr/share/licenses/"$pkgname"/
    install -m 644 README{,_CSO,_ZSO}.md "$pkgdir"/usr/share/doc/"$pkgname"/
}
