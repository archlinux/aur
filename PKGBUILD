# Maintainer: Stefan Tatschner <rumpelsepp@sevenbyte.org>

pkgname='snap'
pkgver=0.3.2
pkgrel=1
pkgdesc="A btrfs snapshot manager"
arch=('any')
url="https://github.com/rumpelsepp/snap"
license=('MIT')
depends=('btrfs-progs')
makedepends=('git' 'asciidoctor>=1.5.3')
source=("$pkgname::git+https://github.com/rumpelsepp/snap.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}/man"
    make ASCIIDOC_MAN_FLAGS=" -d manpage -b manpage -a reproducible" man
}

package() {
    cd "${srcdir}/${pkgname}"
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/snap"
    install -d "${pkgdir}/usr/share/man/man1"
    install -m 755 snap "${pkgdir}/usr/bin/snap"
    install -m 755 snap-init "${pkgdir}/usr/bin/snap-init"
    install -m 755 snap-create "${pkgdir}/usr/bin/snap-create"
    install -m 755 snap-prune "${pkgdir}/usr/bin/snap-prune"
    install -m 755 snap-list "${pkgdir}/usr/bin/snap-list"
    install -m 644 man/*.1 "${pkgdir}/usr/share/man/man1"
    install -m 644 etc/* "${pkgdir}/usr/share/snap"
}
