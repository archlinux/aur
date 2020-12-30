# Maintainer: Nogweii <me@aether.earth>
pkgname=alpm-html
pkgver=0.10.0
pkgrel=1
pkgdesc="Generate a static site for browsing an Arch repo, styled like the main website."
arch=(any)
url="https://code.aether.earth/archlinux/alpm-html"
license=('GPL3')
depends=('pyalpm' 'python-jinja' 'python-inflect')
optdepends=(
  'python-daiquiri: For prettier verbose logs'
  'python-htmlmin: Support minifying the generated HTML'
)
makedepends=('asciidoc')
source=("https://code.aether.earth/archlinux/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha512sums=('c33b09520f701fe5f139463c189d227749de7a95e9d531beea43093986f7d2db88011fc15200060db0d0c02f219d1392e3fe02d89abf686e5351ff719078c51c')
b2sums=('b78656aa58b13d1ae2f8904b4313379e89e2dc1b8a26d5dc75835e920dd3dab37bb30caeead10b05e1815671e95b357285a3ad0c95f270afc33f71d9e200d806')

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
