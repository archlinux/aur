# Maintainer: Nogweii <me@aether.earth>
pkgname=alpm-html
pkgver=0.9.2
pkgrel=1
pkgdesc="Generate a static site for browsing an Arch repo, styled like the main website."
arch=(any)
url="https://code.aether.earth/archlinux/alpm-html"
license=('GPL3')
depends=('pyalpm' 'python-jinja')
makedepends=('asciidoc')
source=("https://code.aether.earth/archlinux/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha512sums=('255a4cab772dedb4fea1d61dabf2641e332e182ba1ffeae3855cb371414ebced4ac9eb20d96e63e6787d2fc51c353163dd6403f27b17f6ab27544f35ad85094b')
b2sums=('ae71a4a9d2054dcde06fff8fe2c252b86df3151244625c3e1da9886a75cc3c699860838269b478e573f42c4a7c1831ba9997568de0149d164cc208b593dea5b5')

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
