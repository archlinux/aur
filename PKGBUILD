# $Id: $
# Maintainer: David C. Rankin <drankinatty @ gmail.com>

pkgname=gtkwrite_git
pkgver=0.1.8
pkgrel=3
pkgdesc="GTKwrite Text Editor with Syntax Highlight written in C, GTK+2 & GtkSourceView2 (development version)"
url="https://github.com/drankinatty/${pkgname%_git}"
license=('GPL2')
provides=('gtkwrite')
arch=('i686' 'x86_64')
options=('!emptydirs')
depends=('gtksourceview2')
makedepends=('git' 'glib2' 'gtk2' 'gtksourceview2')
source=("git+https://github.com/drankinatty/${pkgname%_git}.git")
sha1sums=(SKIP)
conflicts=(gtkwrite)

prepare() {
    cd "${srcdir}/${pkgname%_git}"
}

build() {
    cd "${srcdir}/${pkgname%_git}"
    make with=-DWGTKSOURCEVIEW2
}

package() {
    cd "${srcdir}/${pkgname%_git}"

    install -d -m755 ${pkgdir}/usr/bin
    install -m755 bin/${pkgname%_git} ${pkgdir}/usr/bin/${pkgname}

    install -D -m644 styles/gtkwrite.xml "${pkgdir}/usr/share/gtksourceview-2.0/styles/gtkwrite.xml"
    install -m644 styles/gtkwrite_light.xml "${pkgdir}/usr/share/gtksourceview-2.0/styles"

    install -D -m644 img/gtkwrite.png "${pkgdir}/usr/share/${pkgname%_git}/img/gtkwrite.png"
    install -m644 img/gtkwrite.ico "${pkgdir}/usr/share/${pkgname%_git}/img"
    install -m644 gtkrc-2.0_gtkwrite "${pkgdir}/usr/share/${pkgname%_git}"

    install -D -m644 gpl-2.0.txt "${pkgdir}/usr/share/licenses/${pkgname}/gpl-2.0.txt"
    install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
