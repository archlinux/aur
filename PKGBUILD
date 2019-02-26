# $Id: $
# Maintainer: David C. Rankin <drankinatty @ gmail.com>

pkgname=gtkwrite
pkgver=0.2.5
pkgrel=1
pkgdesc="GTKwrite Text Editor with Syntax Highlight written in C, GTK+2 & GtkSourceView2"
url="https://github.com/drankinatty/${pkgname}"
license=('GPL2')
provides=('gtkwrite')
arch=('i686' 'x86_64')
options=('!emptydirs')
depends=('gtk-engines' 'gtksourceview2')
makedepends=('glib2' 'gtk2' 'gtksourceview2')
source=("https://github.com/drankinatty/${pkgname}/archive/v${pkgver}.tar.gz")
sha1sums=('04de1e571dedb64c4d5652d531cb76fe590df657')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make with=-DWGTKSOURCEVIEW2
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -d -m755 ${pkgdir}/usr/bin
    install -m755 bin/${pkgname} ${pkgdir}/usr/bin

    install -D -m644 gpl-2.0.txt "${pkgdir}/usr/share/licenses/${pkgname}/gpl-2.0.txt"
    install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -D -m644 img/gtkwrite.png "${pkgdir}/usr/share/${pkgname}/img/gtkwrite.png"
    install -m644 img/gtkwrite.ico "${pkgdir}/usr/share/${pkgname}/img"

    install -d -m755 "${pkgdir}/usr/share/gtksourceview-2.0/styles"
    install -m644 styles/gtkwrite.xml "${pkgdir}/usr/share/gtksourceview-2.0/styles"
    install -m644 styles/gtkwrite_light.xml "${pkgdir}/usr/share/gtksourceview-2.0/styles"

    install -d -m755 "${pkgdir}/usr/share/gtksourceview-2.0/language-specs"
    install -m644 language-specs/apache.lang "${pkgdir}/usr/share/gtksourceview-2.0/language-specs"
    install -m644 language-specs/asm-intel.lang "${pkgdir}/usr/share/gtksourceview-2.0/language-specs"
    install -m644 language-specs/gnuplot.lang "${pkgdir}/usr/share/gtksourceview-2.0/language-specs"
    install -m644 language-specs/xorg.conf.lang "${pkgdir}/usr/share/gtksourceview-2.0/language-specs"
}
