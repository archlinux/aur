# Maintainer: Nogweii <me@aether.earth>
pkgname=alpm-html
pkgver=0.9.1
pkgrel=1
pkgdesc="Generate a static site for browsing an Arch repo, styled like the main website."
arch=(any)
url="https://code.aether.earth/archlinux/alpm-html"
license=('GPL3')
depends=('pyalpm' 'python-jinja')
makedepends=('asciidoc')
source=("https://code.aether.earth/archlinux/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha512sums=('a0d42547ee8d02a0038219345a13ce2ead8254f34640aa07d8ed9de118cac683c4f563f90aa08dd36e486407aec5d30108a5dd97800897ddc929cdd9e7155f6c')
b2sums=('c53321fe8e94e41db390d49041713ad96351a355c3895cf87a8ac12e0e1db4710d2684c7bd7a3e4beb57a4e85f03ffdd2a756d0099df1081a20043bc18b6c015')

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
