# $Id: $
# Maintainer: David C. Rankin <drankinatty @ gmail.com>

pkgname=gtkwrite
pkgver=0.1.8
pkgrel=2
pkgdesc="GTKwrite Text Editor with Syntax Highlight written in C, GTK+2 & GtkSourceView2"
url="https://github.com/drankinatty/${pkgname}"
license=('GPL2')
provides=('gtkwrite')
arch=('i686' 'x86_64')
options=('!emptydirs')
depends=('gtksourceview2')
makedepends=('gcc' 'glib2' 'gtk2' 'gtksourceview2' 'make' 'pkgconf')
source=("https://github.com/drankinatty/${pkgname}/archive/v${pkgver}.tar.gz")
sha1sums=('ead1654110097788efbdf35980dc9703b74a9825')

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
}
