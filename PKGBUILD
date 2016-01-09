# Maintainer: Martin Baillie <martin.t.baillie;gmail>

pkgname=cw
pkgver=1.0.16
pkgrel=4
pkgdesc='A non-intrusive real-time ANSI color wrapper for common unix-based commands'
url='http://cwrapper.sourceforge.net'
arch=('i686' 'x86_64')
license=('GPL')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("http://cwrapper.sourceforge.net/cw-${pkgver}.tar.gz")
sha256sums=('768824c16d6ad6201dc528c7b596f9577c0eca8b43ed9a3c356c374e64c2b535')

package() {
    cd "${pkgname}-${pkgver}"
    CPPFLAGS="" ./configure --prefix="${pkgdir}/usr" --mandir="${pkgdir}/usr/share/man"
    mkdir -p "${pkgdir}/"{/usr/bin,/usr/lib/cw/etc,/usr/share/man/man1}
    make install
    for f in $(find "${pkgdir}"/usr/lib/cw -type f);do sed -i "s_${pkgdir}__" "$f";done
    # use of cw with gcc/g++ is fundamentally broken
    rm "${pkgdir}"{/usr/lib/cw/gcc,/usr/lib/cw/g++}
}

# vim:set ts=2 sw=2
