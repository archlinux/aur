# Maintainer: Alva <a at u8 dot is>
_pkgbasename=passphrase
_exename=pp
pkgname=${_pkgbasename}-git
pkgrel=5
pkgver=r7.3c9d418
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

package() {
    cd "${srcdir}/${_pkgbasename}"
    install -D -m755 zig-cache/bin/$_exename "${pkgdir}/usr/bin/$_exename"
    install -D -m644 zig-cache/share/pp/en.txt "${pkgdir}/usr/share/$_exename/en.txt"
    install -D -m644 zig-cache/share/man/man1/pp.1 "${pkgdir}/usr/share/man/man1/pp.1"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/$_exename/LICENSE"
}
