# Maintainer: Brainfuck <brainfucksec@protonmail.com>

pkgname=ohsnap-otb
pkgver=1.8.0
pkgrel=3
pkgdesc="Monospaced font based on Artwiz Snap (OTB version)"
url="https://sourceforge.net/projects/osnapfont"
arch=('any')
license=('GPL2')
makedepends=('git' 'fonttosfnt-git')
source=("https://sourceforge.net/projects/osnapfont/files/ohsnap-${pkgver}.tar.gz")
md5sums=('aeb3d8e1f9634900036f886a14b3b03a')
sha256sums=('081729e01699a867b9ad792e63a17d2ab333a6073833a6a8f3f27f32fc27185f')

package() {
    cd "${srcdir}/ohsnap-${pkgver}"

    install -d "${pkgdir}/usr/share/doc/${pkgname}"
    install -m644 README.ohsnap "${pkgdir}/usr/share/doc/${pkgname}"

    for f in *.pcf; do
        fonttosfnt -c -o "${f/pcf/otb}" "$f"
    done

    for i in *.otb; do
        install -Dm 644 $i "${pkgdir}/usr/share/fonts/misc/$i"
    done
}

# vim:set ts=2 sw=2
