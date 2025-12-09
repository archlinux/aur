# Maintainer: Reyshyram <reyshyram@gmail.com>
# Contributor: Inkurey22 <inkurey22.tr@proton.me>

pkgname=banana-coding-style-checker-bin
_pkgname=banana-coding-style-checker
pkgver=20251120164557
pkgrel=1
pkgdesc="Epitech banana coding style checker (binary from Ubuntu PPA)"
arch=('x86_64')
url="https://launchpad.net/~epitech/+archive/ubuntu/ppa"
license=('GPL2')
depends=('clang20')
makedepends=('binutils')
provides=("$_pkgname")
conflicts=("$_pkgname")

sha256sums=('b01eba66e28ddd02b1f253ae261c85754a7a4e80bf1a73efec927c4003c6e3c3')

source=("${_pkgname}-${pkgver}.deb::https://ppa.launchpadcontent.net/epitech/ppa/ubuntu/pool/main/b/banana-coding-style-checker/banana-coding-style-checker_${pkgver}_amd64.deb")

package () {
    ar x "${srcdir}/${_pkgname}-${pkgver}.deb" --output "${srcdir}"
    tar xf "${srcdir}/data.tar.zst" -C "${pkgdir}"

    install -d "$pkgdir/usr/lib/epiclang/plugins"

    chmod +x "$pkgdir/usr/bin/banana-check-repo"

    install -m644 "$pkgdir/usr/lib/epiclang-plugin-banana.so.${pkgver}" \
        "$pkgdir/usr/lib/epiclang/plugins/epitech-plugin-banana.so"
    install -Dm644 "$pkgdir/usr/share/doc/${_pkgname}/copyright" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    rm -f "$pkgdir/usr/lib/epiclang-plugin-banana.so.${pkgver}"
    rm -rf "$pkgdir/usr/share/doc"
    rm -f "${srcdir}/debian-binary" "${srcdir}/control.tar.zst" "${srcdir}/data.tar.zst"
}
