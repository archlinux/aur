# Maintainer: Jamie Beardslee <beardsleejamie@gmail.com>

pkgname=gnu-c-manual-text
pkgver=0.2.5
pkgrel=1
arch=(any)
pkgdesc="GNU C Reference Manual"
url="https://www.gnu.org/software/gnu-c-manual/"
license=('FDL-1.3')
makedepends=('texinfo')
source=("ftp://ftp.gnu.org/gnu/gnu-c-manual/gnu-c-manual-$pkgver.tar.gz")
md5sums=('4fb89ba63d0c80a1f2265148a75dcc17')

build() {
    cd "${srcdir}/gnu-c-manual-${pkgver}"
    echo -e "gnu-c-manual.txt: \$(GNU_C_MANUAL_SOURCES)" >> Makefile
    echo -e "\t\$(MAKEINFO) --plaintext --no-split gnu-c-manual.texi -o gnu-c-manual.txt" >> Makefile
    make gnu-c-manual.info gnu-c-manual.html
    make gnu-c-manual.info gnu-c-manual.txt
}

package() {
    cd "${srcdir}/gnu-c-manual-${pkgver}"
    mkdir -p "${pkgdir}/usr/share/info" "${pkgdir}/usr/share/doc/gnu-c-manual"
    install -D -m644 gnu-c-manual.info "${pkgdir}/usr/share/info"
    install -D -m644 gnu-c-manual.html "${pkgdir}/usr/share/doc/gnu-c-manual"
    install -D -m644 gnu-c-manual.txt "${pkgdir}/usr/share/doc/gnu-c-manual"
}
