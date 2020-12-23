# Maintainer: Nogweii <me@aether.earth>
pkgname=alpm-html
pkgver=0.9.0
pkgrel=1
pkgdesc="Generate a static site for browsing an Arch repo, styled like the main website."
arch=(any)
url="https://code.aether.earth/archlinux/alpm-html"
license=('GPL3')
depends=('pyalpm' 'python-jinja')
makedepends=('asciidoc')
source=("https://code.aether.earth/archlinux/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha512sums=('5e160abcb3af6c8252710e27848c5cc0b3f9a515e2b77497fede1e9c9ef9821ba49d66a238a0df4537a2bf1c21c0d62cc05187ff13c35ec29b5fc60eb85a0171')
b2sums=('4ced9205e1af2e5e8ccff928ede787abeeaae0e946c0fa877c588d696cbcdd8c4ef5cceaec4fb8e48416d2c84709d24460d3632fe2eefa89f8d437e68a55b660')

build() {
    cd "${srcdir}/$pkgname-v$pkgver"
    a2x -d manpage -f manpage alpm-html.1.asciidoc
}

package() {
    cd "${srcdir}/$pkgname-v$pkgver"

    install -D -m 0644 resources/* -t "${pkgdir}/usr/share/${pkgname}"
    install -D -m 0755 alpm-html.py "${pkgdir}/usr/bin/alpm-html"
    install -D -m 0644 CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}"
    install -D -m 0644 -t "${pkgdir}/usr/share/man/man1/" alpm-html.1
}
