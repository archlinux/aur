# $Id: $
# Maintainer: David C. Rankin <drankinatty @ gmail.com>

pkgname=gtkwrite_git
pkgver=0.1.3
pkgrel=2
pkgdesc="GTKwrite Text Editor with Syntax Highlight written in C, GTK+2 & GtkSourceView2 (development version)"
url="https://github.com/drankinatty/${pkgname%_git}"
license=('GPL-2.0+')
provides=('gtkwrite')
arch=('i686' 'x86_64')
options=('!emptydirs')
makedepends=('gcc' 'glib2' 'gtk2' 'gtksourceview2')
source=("git+https://github.com/drankinatty/${pkgname%_git}.git")
validpgpkeys=()
sha1sums=(SKIP)

prepare() {
    cd "${srcdir}/${pkgname%_git}"
    msg2 'prepare() gtkwrite - done'
}

build() {
    msg2 'build() gtkwrite'
    cd "${srcdir}/${pkgname%_git}"
    make with=-DWGTKSOURCEVIEW2
}

package() {
    msg2 'package() gtkwrite'
    cd "${srcdir}/${pkgname%_git}"

    install -d -m755 ${pkgdir}/usr/bin
    install -m755 bin/${pkgname%_git} ${pkgdir}/usr/bin/${pkgname}

    install -D -m644 gtkwrite.xml "${pkgdir}/usr/share/gtksourceview-2.0/styles/gtkwrite.xml"
    install -D -m644 gpl-2.0.txt "${pkgdir}/usr/share/licenses/${pkgname}/gpl-2.0.txt"
    install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
