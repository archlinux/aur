# Maintainer: Alva <a at u8 dot is>
_pkgbasename=passphrase
pkgname=${_pkgbasename}-git
pkgrel=1
pkgver=r11.0faa7ba
pkgdesc="Zero-dependency passphrase generator, written in Zig"
arch=('any')
url="https://git.sr.ht/~alva/${_pkgbasename}"
license=('MIT')
makedepends=('zig>=0.6.0')
source=(git+https://git.sr.ht/~alva/${_pkgbasename})
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgbasename}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgbasename}"
    zig build -Drelease-fast
}

check() {
    cd "${srcdir}/${_pkgbasename}"
    zig build test
}

package() {
    cd "${srcdir}/${_pkgbasename}"
    install -D -m755 zig-cache/bin/$_pkgbasename "${pkgdir}/usr/bin/$_pkgbasename"
    install -D -m644 zig-cache/share/$_pkgbasename/en.txt "${pkgdir}/usr/share/$_pkgbasename/en.txt"
    install -D -m644 zig-cache/share/man/man1/${_pkgbasename}.1 "${pkgdir}/usr/share/man/man1/${_pkgbasename}.1"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/$_pkgbasename/LICENSE"
}
